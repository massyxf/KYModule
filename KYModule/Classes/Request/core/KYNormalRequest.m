//
//  NDBaseRequest.m
//  NDTruck
//
//  Created by yxf on 2019/11/2.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "KYNormalRequest.h"
#import "KYNetServiceManager.h"
#import "KYModuleHeader.h"

@interface KYNormalRequest (){
    NSURLSessionDataTask *_task;
}

@end

@implementation KYNormalRequest

-(void)dealloc{
    KYLog(@"====>%@:dealloc",[self class]);
}

#pragma mark - 公有参数
-(NSString *)baseUrl{
    return @"";
}

-(NSDictionary *)publicParams{
    return @{};
}

#pragma mark - 自定义参数
- (nonnull NSString *)apiStr {
    return @"";
}

-(NSArray<NSString *> *)paramKeys{
    return @[];
}

- (nonnull NSDictionary *)customParams {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [self.paramKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        params[obj] = [self valueForKey:obj];
    }];
    return [params copy];
}

#pragma mark - public func
-(NSURLSessionDataTask *)startRequestWithCompletion:(KYRequestComplete)completion{
    NSString *url = self.baseUrl;
    if (self.apiStr.length > 0) {
        url = [self.baseUrl stringByAppendingPathComponent:self.apiStr];
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:self.publicParams];
    if (self.customParams.allValues.count) {
        [dict addEntriesFromDictionary:self.customParams];
    }
    
    void (^resultComplete)(NSDictionary *,NSError *) = ^(NSDictionary *_Nullable result, NSError *_Nullable error){
        if (result) {
            completion(self,result,nil);
            return ;
        }
        
        if (error) {
            if (self.retryCount > 0) {
                self.retryCount --;
                [self startRequestWithCompletion:completion];
                return;
            }
            completion(self,nil,error);
        }
    };
    if (self.requestType == KYRequestPost) {
        _task = [KYNetServiceManager postUrl:url params:dict complete:resultComplete];
    }else{
        _task =  [KYNetServiceManager getUrl:url params:dict complete:resultComplete];
    }
    return _task;
}

-(void)cancel{
    [_task cancel];
}

@end
