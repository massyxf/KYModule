//
//  KYChainRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYChainRequest : KYRequest

@property (nonatomic,copy)KYRequestComplete requestComplete;
///链式请求全部完成的回调,但是在cancel时不会回调
@property (nonatomic,copy)KYRequestVoidComplete chainComplete;

-(instancetype)initWithRequestArr:(NSArray<KYRequest *> *)requestArr;

@end

NS_ASSUME_NONNULL_END
