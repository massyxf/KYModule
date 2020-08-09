//
//  KYGroupRequest.m
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYGroupRequest.h"

@interface KYGroupRequest ()

@property (nonatomic,copy)NSArray<KYRequest *> *requestArr;
@property (nonatomic,strong)KYRequest *endRequest;

///请求完成源于cancel
@property (nonatomic,assign)BOOL isCancelReason;

@end

@implementation KYGroupRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr endRequest:(KYRequest *)request{
    if (self = [super init]) {
        _requestArr = [requestArr copy];
        _endRequest = request;
    }
    return self;
}

///每个子请求都会通过completion回调，因此需要区别处理
-(NSURLSessionTask *)startRequestWithCompletion:(KYRequestComplete)completion{
    dispatch_queue_t queue = dispatch_queue_create("ky_group_request_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    [_requestArr enumerateObjectsUsingBlock:^(KYRequest * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        dispatch_group_async(group, queue, ^{
            [obj startRequestWithCompletion:^(KYRequest * _Nullable request, NSDictionary * _Nullable result, NSError * _Nullable error) {
                if (request != obj) {
                    !completion ? : completion(request,result,error);
                    return;
                }
                !completion ? : completion(request,result,error);
                dispatch_group_leave(group);
            }];
        });
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (self.endRequest) {
            [self.endRequest startRequestWithCompletion:^(KYRequest * _Nullable request, NSDictionary * _Nullable result, NSError * _Nullable error) {
                if (request != self.endRequest) {
                    !completion ? : completion(request,result,error);
                    return;
                }
                !completion ? : completion(request,result,error);
                [self callCompleteBlock:completion];
            }];
            return;
        }
        [self callCompleteBlock:completion];
    });
    return nil;
}

-(void)callCompleteBlock:(KYRequestComplete)completion{
    if (_isCancelReason) {
        return;
    }
    !completion ? : completion(self,@{},nil);
}

-(void)cancel{
    _isCancelReason = YES;
    [_requestArr makeObjectsPerformSelector:@selector(cancel)];
}

@end
