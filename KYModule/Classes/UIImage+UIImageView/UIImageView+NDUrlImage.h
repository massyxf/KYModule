//
//  UIImageView+NDUrlImage.h
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (NDUrlImage)

-(void)setImgWithUrl:(NSString *)url placeholder:(NSString *_Nullable )placeholder;

-(void)setImgWithUrl:(NSString *)url placeholderImg:(UIImage *_Nullable )img;

-(void)setGitImg:(NSString *)img;

@end

NS_ASSUME_NONNULL_END
