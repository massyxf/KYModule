//
//  UIViewController+KYWatermark.m
//  KYModule_Example
//
//  Created by yxf on 2020/10/29.
//  Copyright © 2020 massyxf. All rights reserved.
//

#import "UIViewController+KYWatermark.h"
#import <objc/runtime.h>

static Class water_view_cls = nil;
static char *water_mark_flag = "water_mark_flag";
static char *water_mark_view = "water_mark_view";

@implementation UIViewController (KYWatermark)

+(void)load{
    Method m1 = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method m2 = class_getInstanceMethod([self class], @selector(ky_watermark_viewDidAppear:));
    method_exchangeImplementations(m1, m2);
}

+(void)configWatermarkViewClass:(Class)viewCls{
    water_view_cls = viewCls;
}

-(void)setShowWatermark:(BOOL)showWatermark{
    objc_setAssociatedObject(self, water_mark_flag, @(showWatermark), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)showWatermark{
    return [objc_getAssociatedObject(self, water_mark_flag) boolValue];
}

-(void)setWatermarkView:(UIView *)watermarkView{
    objc_setAssociatedObject(self, water_mark_view, watermarkView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView *)watermarkView{
    return objc_getAssociatedObject(self, water_mark_view);
}

-(void)ky_watermark_viewDidAppear:(BOOL)animated{
    [self ky_watermark_viewDidAppear:animated];
    if (!self.showWatermark) {
        return;
    }
    if (self.watermarkView) {
        self.watermarkView.frame = self.view.bounds;
        [self.view addSubview:self.watermarkView];
        return;
    }
    if (!water_view_cls || ![water_view_cls isKindOfClass:[UIView class]]) {
        return;
    }
    UIView *view = [[water_view_cls alloc] init];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
}



@end
