//
//  KYResourceTool.m
//  KYModule
//
//  Created by yxf on 2020/8/11.
//

#import "KYResourceTool.h"


NSBundle *kyBunble(void){
    static dispatch_once_t onceToken;
    static NSBundle *bundle = nil;
    dispatch_once(&onceToken, ^{
        NSBundle *frameworkBundle = [NSBundle bundleForClass:[KYResourceTool class]];
        NSString *path = [frameworkBundle pathForResource:@"KYModule" ofType:@"bundle"];
        bundle = [NSBundle bundleWithPath:path];
    });
    return bundle;
}

NSMutableDictionary *bundleDic(void){
    static dispatch_once_t onceToken;
    static NSMutableDictionary *dic = nil;
    dispatch_once(&onceToken, ^{
        dic = [NSMutableDictionary dictionary];
    });
    return dic;
}

@implementation KYResourceTool

+(NSString *)resourcePathWithName:(NSString *)name{
    NSBundle *bundle = kyBunble();
    return [bundle pathForResource:name ofType:nil];
}

+(NSString *)resourcePathWithFilename:(NSString *)filename moduleName:(NSString *)moduleName fishClass:(Class)class{
    return @"";
}

@end
