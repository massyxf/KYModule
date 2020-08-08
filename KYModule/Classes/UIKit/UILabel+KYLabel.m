//
//  UILabel+NDLabel.m
//  NDTruck
//
//  Created by yxf on 2019/11/23.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "UILabel+KYLabel.h"


@implementation UILabel (KYLabel)

+(instancetype)ky_labelWithFont:(UIFont *)font textColor:(UIColor *)color{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textColor = color;
    return label;
}

@end
