//
//  KYResourceTool.h
//  KYModule
//
//  Created by yxf on 2020/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYResourceTool : NSObject

+(NSString *)resourcePathWithName:(NSString *)name;

+(NSString *)resourcePathWithFilename:(NSString *)filename moduleName:(NSString *)moduleName fishClass:(Class)class;

@end

NS_ASSUME_NONNULL_END
