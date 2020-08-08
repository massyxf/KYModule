//
//  UIImageView+NDUrlImage.m
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "UIImageView+NDUrlImage.h"
#import <SDWebImage/SDWebImage.h>

@implementation UIImageView (NDUrlImage)

-(void)setImgWithUrl:(NSString *)url placeholder:(NSString *_Nullable )placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString:url]
            placeholderImage:[UIImage imageNamed:placeholder]];
}

-(void)setImgWithUrl:(NSString *)url placeholderImg:(UIImage *)img{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:img];
}


-(void)setGitImg:(NSString *)img{
    NSString *gifPath = [[NSBundle mainBundle] pathForResource:img ofType:nil];
    NSData *gifData = [[NSData alloc] initWithContentsOfFile:gifPath];
    UIImage *image = [UIImage sd_imageWithGIFData:gifData];
    self.image = image;
}

@end
