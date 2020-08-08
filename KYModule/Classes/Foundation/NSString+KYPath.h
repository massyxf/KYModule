//
//  NSString+KYPath.h
//  KYModule
//
//  Created by yxf on 2020/8/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KYPath)

/// APP名称
+(NSString *)ky_appname;

/// home目录
+ (NSString *)ky_homePath;

/// cache 目录
+ (NSString *)ky_cachePath;

/// 文档目录路径
+ (NSString *)ky_documentsPath;

/// Application Support 目录
+ (NSString *)ky_supportPath;

/// Application Support目录/appname
+ (NSString *)ky_appSupportPath;

/// temp 目录
+ (NSString *)ky_tmpPath;

/// 在此路径下扩展路径
/// @param appendingPath 被扩展的路径
- (NSString *)ky_appendPathComponent:(NSString *)appendingPath;

/// 获取一个文档目录中的路径
- (NSString *)ky_appendDocPath;

/// 获取一个 'Application Support' 目录中的路径
- (NSString *)ky_appendSupportPath;

///获取一个 'cache' 目录中的路径
- (NSString *)ky_appendCachePath;

///获取一个 'temp' 目录中的路径
- (NSString *)ky_appendTmpPath;

@end

NS_ASSUME_NONNULL_END
