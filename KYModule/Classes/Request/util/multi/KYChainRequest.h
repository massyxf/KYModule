//
//  KYChainRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYChainRequest : KYRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr;

@end

NS_ASSUME_NONNULL_END
