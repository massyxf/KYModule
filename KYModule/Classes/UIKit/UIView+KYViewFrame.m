//
//  UIView+NDViewFrame.m
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "UIView+KYViewFrame.h"

@implementation UIView (KYViewFrame)

-(void)setKy_x:(CGFloat)ky_x{
    CGRect frame = self.frame;
    frame.origin.x = ky_x;
    self.frame = frame;
}

-(CGFloat)ky_x{
    return CGRectGetMinX(self.frame);
}

-(void)setKy_y:(CGFloat)ky_y{
    CGRect frame = self.frame;
    frame.origin.y = ky_y;
    self.frame = frame;
}

-(CGFloat)ky_y{
    return CGRectGetMinY(self.frame);
}

-(void)setKy_width:(CGFloat)ky_width{
    CGRect frame = self.frame;
    frame.size.width = ky_width;
    self.frame = frame;
}

-(CGFloat)ky_width{
    return CGRectGetWidth(self.frame);
}

-(void)setKy_height:(CGFloat)ky_height{
    CGRect frame = self.frame;
    frame.size.height = ky_height;
    self.frame = frame;
}

-(CGFloat)ky_height{
    return CGRectGetHeight(self.frame);
}

-(void)setKy_maxY:(CGFloat)ky_maxY{
    self.ky_y = ky_maxY - self.ky_height;
}

-(CGFloat)ky_maxY{
    return CGRectGetMaxY(self.frame);
}

-(void)setKy_maxX:(CGFloat)ky_maxX{
    self.ky_x = ky_maxX - self.ky_width;
}

-(CGFloat)ky_maxX{
    return CGRectGetMaxX(self.frame);
}

-(void)setKy_centerX:(CGFloat)ky_centerX{
    CGPoint center = self.center;
    center.x = ky_centerX;
    self.center = center;
}

- (CGFloat)ky_centerX{
    return self.center.x;
}

-(void)setKy_centerY:(CGFloat)ky_centerY{
    CGPoint center = self.center;
    center.y = ky_centerY;
    self.center = center;
}

-(CGFloat)ky_centerY{
    return self.center.y;
}

-(void)setKy_size:(CGSize)ky_size{
    CGRect frame = self.frame;
    frame.size = ky_size;
    self.frame = frame;
}

-(CGSize)ky_size{
    return self.frame.size;
}

@end
