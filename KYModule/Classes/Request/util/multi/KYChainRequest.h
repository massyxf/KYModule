//
//  KYChainRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

///链式请求，每个请求依次执行，回调统一走completion，当所有请求执行完成时，视为执行完毕,执行chainrequest的completion回调
///取消请求，不会走chainrequest的completion回调
@interface KYChainRequest : KYRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr;

@end

NS_ASSUME_NONNULL_END
