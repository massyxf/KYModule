//
//  KYViewController.m
//  KYModule
//
//  Created by massyxf on 08/07/2020.
//  Copyright (c) 2020 massyxf. All rights reserved.
//

#import "KYViewController.h"
#import <NSString+KYExtension.h>

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
