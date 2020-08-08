//
//  KYNetServiceConfig.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYNetServiceConfig : NSObject

/**
 超时时间:默认值30秒,如果<=0，则没有超时时间
 */
@property (nonatomic,assign)NSTimeInterval timeOut;

/**
 响应内容的类型:默认值 @"application/json", @"text/json", @"text/javascript",@"text/html"
 */
@property (nonatomic,assign)NSSet *acceptTypes;

@end

NS_ASSUME_NONNULL_END
