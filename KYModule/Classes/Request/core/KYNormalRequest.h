//
//  NDBaseRequest.h
//  NDTruck
//
//  Created by yxf on 2019/11/2.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "KYRequest.h"
#import "KYNetServiceConst.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYNormalRequest : KYRequest

/// 重试的次数，默认不重试
@property (nonatomic,assign)int retryCount;

/// base url
@property (nonatomic,copy)NSString *baseUrl;
/// api
-(NSString *)apiStr;

/// 请求的公共参数
@property (nonatomic,strong)NSDictionary *publicParams;
// 自定义参数
-(NSArray<NSString *> *)paramKeys;
-(NSDictionary *)customParams;

/// 请求类型，默认NDRequestPost
@property (nonatomic,assign)KYRequestType requestType;

-(NSURLSessionDataTask *)startRequestWithCompletion:(KYRequestComplete)completion;

@end

NS_ASSUME_NONNULL_END
