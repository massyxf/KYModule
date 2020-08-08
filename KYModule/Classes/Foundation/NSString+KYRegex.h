//
//  NSString+NDRegex.h
//  NDTruck
//
//  Created by yxf on 2019/11/22.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (KYRegex)

///手机号匹配
-(BOOL)ky_isMobileNumber;

////正则匹配17位车架号
+(BOOL)ky_isVinNumber:(NSString *)vinNumber;

///车牌号验证
+ (BOOL)ky_isCarNumber:(NSString *)carNumber;
///车牌号验证,不含省份
+ (BOOL)ky_isCarNumberWithoutProvince:(NSString *)carNumber;

///正则匹配银行卡号是否正确
+ (BOOL)ky_isBankNumber:(NSString *)bankNumber;

@end

NS_ASSUME_NONNULL_END
