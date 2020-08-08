//
//  NSString+NDExtension.h
//  NDTruck
//
//  Created by yxf on 2019/11/22.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KYExtension)

///去除首尾空格和换行
-(NSString *)ky_trimString;

///获取首字母
-(NSString *)ky_firstChar;

///生产一个uuid
+ (NSString *)ky_uuid;

///小数保留1位小数转成字符串
+(NSString *)ky_onePointNumToString:(double)num;
///小数保留2位小数转成字符串
+(NSString *)ky_twoPointNumToString:(double)num;
///保留指定位数的小数
+(NSString *)ky_numToString:(double)num pointCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END
