//
//  UIViewController+KYWatermark.h
//  KYModule_Example
//
//  Created by yxf on 2020/10/29.
//  Copyright © 2020 massyxf. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (KYWatermark)

+(void)configWatermarkViewClass:(Class)viewCls;

@property (nonatomic,assign)BOOL showWatermark;

@property (nonatomic,strong)UIView *watermarkView;

@end

NS_ASSUME_NONNULL_END
