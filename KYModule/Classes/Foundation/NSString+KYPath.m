//
//  NSString+KYPath.m
//  KYModule
//
//  Created by yxf on 2020/8/7.
//

#import "NSString+KYPath.h"

@implementation NSString (KYPath)

+(NSString *)ky_appname{
    NSDictionary *bundeleDic = [[NSBundle mainBundle] infoDictionary];
    return bundeleDic[@"CFBundleDisplayName"];
}

+ (NSString *)ky_homePath {
    return NSHomeDirectory();
}

+ (NSString *)ky_cachePath {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString *)ky_documentsPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString *)ky_supportPath {
    NSString *supportPath = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES).lastObject;
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:supportPath]) {
        NSError *error = nil;
        if (![fm createDirectoryAtPath:supportPath withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"创建support path出错:%@",error);
        }
    }
    return supportPath;
}

+ (NSString *)ky_appSupportPath {
    NSString *appname = [self ky_appname];
    return [appname ky_appendSupportPath];
}

+ (NSString *)ky_tmpPath {
    return NSTemporaryDirectory();
}

- (NSString *)ky_appendPathComponent:(NSString *)appendingPath {
    return [appendingPath stringByAppendingPathComponent:self];
}

- (NSString *)ky_appendDocPath {
    return [self ky_appendPathComponent:[NSString ky_documentsPath]];
}

- (NSString *)ky_appendSupportPath {
    return [self ky_appendPathComponent:[NSString ky_supportPath]];
}

- (NSString *)ky_appendCachePath {
    return [self ky_appendPathComponent:[NSString ky_cachePath]];
}

- (NSString *)ky_appendTmpPath {
    return [self ky_appendPathComponent:[NSString ky_tmpPath]];
}

@end
