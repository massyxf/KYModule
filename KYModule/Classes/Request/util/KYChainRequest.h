//
//  KYChainRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

typedef void(^KYChainRequestComplete)(KYRequest * _Nullable request,NSDictionary *_Nullable result,NSError *_Nullable error,BOOL *_Nullable shouldContinue);

NS_ASSUME_NONNULL_BEGIN

@interface KYChainRequest : KYRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr;

-(void)startChainRequestsWithRequestComplete:(nullable KYChainRequestComplete)requestComplete
                               chainComplete:(nullable void(^)(void))chainComplete;

@end

NS_ASSUME_NONNULL_END
