//
//  UIView+NDViewFrame.h
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KYViewFrame)

@property (nonatomic,assign)CGFloat ky_x;
@property (nonatomic,assign)CGFloat ky_y;
@property (nonatomic,assign)CGFloat ky_width;
@property (nonatomic,assign)CGFloat ky_height;
@property (nonatomic,assign)CGFloat ky_centerX;
@property (nonatomic,assign)CGFloat ky_centerY;
@property (nonatomic,assign)CGFloat ky_maxY;
@property (nonatomic,assign)CGFloat ky_maxX;
@property (nonatomic,assign)CGSize ky_size;


@end

NS_ASSUME_NONNULL_END
