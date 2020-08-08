//
//  NSString+NDExtension.m
//  NDTruck
//
//  Created by yxf on 2019/11/22.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "NSString+KYExtension.h"

@implementation NSString (KYExtension)

-(NSString *)ky_trimString{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)ky_firstChar{
    NSString *text = [self ky_trimString];
    if (text == 0) {
        return @"##";
    }
    return [text substringToIndex:1];
}

+ (NSString *)ky_uuid {
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
    CFRelease(strUuid);
    CFRelease(uuid);
    return  str;
}

///小数保留以为小数转成字符串
+(NSString *)ky_onePointNumToString:(double)num{
    NSInteger altNum = num * 10;
    if (altNum % 10 == 0) {
        return [NSString stringWithFormat:@"%ld",(long)num];
    }
    return [NSString stringWithFormat:@"%.1f",num];
}

+(NSString *)ky_twoPointNumToString:(double)num{
    NSInteger altNum = num * 100;
    if (altNum % 100 == 0) {
        return [NSString stringWithFormat:@"%ld",(long)num];
    }
    if (altNum % 10 == 0) {
        return [NSString stringWithFormat:@"%.1f",num];
    }
    return [NSString stringWithFormat:@"%.2f",num];
}

+(NSString *)ky_numToString:(double)num pointCount:(NSInteger)count{
    if (count <= 0) {
        return @(num).stringValue;
    }
    NSInteger multiNum = pow(10, count);
    NSInteger alterNum = num * multiNum;
    for (NSInteger i=count; i>=0; i--) {
        NSInteger subMultiNum = pow(10, i);
        if (alterNum % subMultiNum == 0) {
            NSString *format = [NSString stringWithFormat:@"%%.%ldf",count-i];
            return [NSString stringWithFormat:format,num];
        }
    }
    return @(num).stringValue;
}

@end
