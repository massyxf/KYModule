//
//  KYGroupRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

///组请求，每个请求依次执行，回调统一走completion，当所有请求执行完成时，视为执行完毕,执行grouprequest的completion回调
///取消请求，不会走grouprequest的completion回调
@interface KYGroupRequest : KYRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr endRequest:(KYRequest *_Nullable)request;

@end

NS_ASSUME_NONNULL_END
