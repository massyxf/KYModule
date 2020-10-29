//
//  KYResourceBundle.m
//  AFNetworking
//
//  Created by yxf on 2020/8/11.
//

#import "KYResourceBundle.h"

@interface KYResourceBundle (){
    NSMutableSet *_classSet;
}

@end

@implementation KYResourceBundle

- (id)copyWithZone:(nullable NSZone *)zone{
    KYResourceBundle *bundle = [[KYResourceBundle allocWithZone:zone] init];
    bundle->_classSet = [_classSet mutableCopy];
    return bundle;
}

-(NSMutableSet *)classSet{
    if (!_classSet) {
        _classSet = [NSMutableSet set];
    }
    return _classSet;
}

-(void)addClass:(NSString *)classname{
    if ([self containClass:classname]) {
        return;
    }
    [_classSet addObject:classname];
}

-(BOOL)containClass:(NSString *)classname{
    return [[self classSet] containsObject:classname];
}

-(BOOL)isEqual:(id)object{
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    KYResourceBundle *obj = (KYResourceBundle *)object;
    return NO;
}

@end
