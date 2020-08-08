//
//  KYGroupRequest.m
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYGroupRequest.h"

@interface KYGroupRequest ()

@property (nonatomic,copy)NSArray<KYNormalRequest *> *requestArr;
@property (nonatomic,strong)KYNormalRequest *endRequest;

@end

@implementation KYGroupRequest

-(instancetype)initWithRequestArr:(NSArray<KYNormalRequest *> *)requestArr endRequest:(KYNormalRequest *)request{
    if (self = [super init]) {
        _requestArr = [requestArr copy];
        _endRequest = request;
    }
    return self;
}

-(void)startGroupRequestsWithRequestComplete:(void (^)(KYNormalRequest * _Nonnull, NSDictionary * _Nonnull, NSError * _Nonnull))requestComplete groupComplete:(void (^)(void))groupComplete{
    dispatch_queue_t queue = dispatch_queue_create("ky_group_request_queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    [_requestArr enumerateObjectsUsingBlock:^(KYNormalRequest * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        dispatch_group_async(group, queue, ^{
            [obj startRequestWithCompletion:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
                !requestComplete ? : requestComplete(obj,result,error);
                dispatch_group_leave(group);
            }];
        });
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        if (self.endRequest) {
            [self.endRequest startRequestWithCompletion:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
                !requestComplete ? : requestComplete(self.endRequest,result,error);
                !groupComplete ? : groupComplete();
            }];
            return;
        }
        !groupComplete ? : groupComplete();
    });
}

-(void)cancel{
    [_requestArr makeObjectsPerformSelector:@selector(cancel)];
}

@end
