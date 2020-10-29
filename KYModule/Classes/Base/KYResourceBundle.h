//
//  KYResourceBundle.h
//  AFNetworking
//
//  Created by yxf on 2020/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYResourceBundle : NSObject<NSCopying>

-(void)addClass:(NSString *)classname;

-(BOOL)containClass:(NSString *)classname;

@end

NS_ASSUME_NONNULL_END
