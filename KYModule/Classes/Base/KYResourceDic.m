//
//  KYResourceDic.m
//  AFNetworking
//
//  Created by yxf on 2020/8/11.
//

#import "KYResourceDic.h"
#import "KYResourceBundle.h"

@interface KYResourceDic ()

@end

@implementation KYResourceDic

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        KYResourceBundle *bundle = [[KYResourceBundle alloc] init];
        dic[bundle] = @"haha";
        NSLog(@"===>dic: %@",dic);
    }
    return self;
}

@end
