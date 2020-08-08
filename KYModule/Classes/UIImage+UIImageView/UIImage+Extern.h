//
//  UIImage+Extern.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extern)

+(UIImage *)imageFromContextWithColor:(UIColor *)color;
//给我一种颜色，一个尺寸，我给你返回一个UIImage
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
