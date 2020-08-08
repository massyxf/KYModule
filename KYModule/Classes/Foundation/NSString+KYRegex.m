//
//  NSString+NDRegex.m
//  NDTruck
//
//  Created by yxf on 2019/11/22.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "NSString+KYRegex.h"

@implementation NSString (KYRegex)

-(BOOL)ky_isMobileNumber{
    if (self.length == 0) {
        return NO;
    }
//    return self.length == 11;
    NSString *phoneRegex=@"1[3456789]([0-9]){9}";
    NSPredicate *phonePre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phonePre evaluateWithObject:self];
}

////正则匹配17位车架号
+(BOOL)ky_isVinNumber:(NSString *)vinNumber{
    NSString *bankNum=@"^[A-Za-z0-9]{17}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:vinNumber];
    return isMatch;
}

///正则匹配银行卡号是否正确
+ (BOOL)ky_isBankNumber:(NSString *) bankNumber{
    NSString *bankNum=@"^([0-9]{16}|[0-9]{19})$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",bankNum];
    BOOL isMatch = [pred evaluateWithObject:bankNumber];
    return isMatch;
}

///车牌号验证
+ (BOOL)ky_isCarNumber:(NSString *)carID{
    if (carID.length==7) {
        //普通汽车，7位字符，不包含I和O，避免与数字1和0混淆
        NSString *carRegex = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领]{1}[a-hj-np-zA-HJ-NP-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{4}[a-hj-np-zA-HJ-NP-Z0-9京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领]$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }else if(carID.length==8){
        //新能源车,8位字符，第一位：省份简称（1位汉字），第二位：发牌机关代号（1位字母）;
        //小型车，第三位：只能用字母D或字母F，第四位：字母或者数字，后四位：必须使用数字;([DF][A-HJ-NP-Z0-9][0-9]{4})
        //大型车3-7位：必须使用数字，后一位：只能用字母D或字母F。([0-9]{5}[DF])
        NSString *carRegex = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领]{1}[a-hj-np-zA-HJ-NP-Z]{1}([0-9]{5}[d|f|D|F]|[d|f|D|F][a-hj-np-zA-HJ-NP-Z0-9][0-9]{4})$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }
    return NO;
}
///车牌号验证,不含省份
+ (BOOL)ky_isCarNumberWithoutProvince:(NSString *)carID{
    if (carID.length==6) {
        NSString *carRegex = @"^[a-hj-np-zA-HJ-NP-Z]{1}[a-hj-np-zA-HJ-NP-Z0-9]{4}[a-hj-np-zA-HJ-NP-Z0-9京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领]$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }else if(carID.length==7){
        NSString *carRegex = @"^[a-hj-np-zA-HJ-NP-Z]{1}([0-9]{5}[d|f|D|F]|[d|f|D|F][a-hj-np-zA-HJ-NP-Z0-9][0-9]{4})$";
        NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
        return [carTest evaluateWithObject:carID];
    }
    return NO;
}

@end
