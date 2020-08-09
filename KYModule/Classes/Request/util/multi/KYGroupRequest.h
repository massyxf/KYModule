//
//  KYGroupRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYGroupRequest : KYRequest

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr endRequest:(KYRequest *_Nullable)request;

@end

NS_ASSUME_NONNULL_END
