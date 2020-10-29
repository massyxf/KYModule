//
//  KYViewController.m
//  KYModule
//
//  Created by massyxf on 08/07/2020.
//  Copyright (c) 2020 massyxf. All rights reserved.
//

#import "KYViewController.h"
#import <NSString+KYExtension.h>
#import <KYModule/KYResourceTool.h>
#import <KYModule/KYResourceDic.h>

#import "UIViewController+KYWatermark.h"
#import "KYWatermarkView.h"

@interface KYViewController ()

@end

@implementation KYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
	
    double num = 0.001;
    NSLog(@"%@",[NSString ky_onePointNumToString:num]);
    NSLog(@"%@",[NSString ky_twoPointNumToString:num]);
    NSLog(@"%@",[NSString ky_numToString:num pointCount:3]);
    
    NSString *path = [KYResourceTool resourcePathWithName:@"1-1.png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    NSLog(@"path:%@,%@",path,image);
    
    KYResourceDic *dic = [[KYResourceDic alloc] init];
    NSLog(@"dic:%@",dic);
    
    NSLog(@"%@",@[@"你好",@"123",@"345"]);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 100, 80, 40);
    btn.backgroundColor = [UIColor greenColor];
    
    self.showWatermark = YES;
    KYWatermarkView *waterView = [[KYWatermarkView alloc] init];
    waterView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    self.watermarkView = waterView;
}

-(void)testAction{
    NSLog(@"===>  test action");
}

@end
