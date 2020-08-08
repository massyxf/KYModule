//
//  KYRequest.m
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYRequest.h"

@interface KYRequest ()

@end

@implementation KYRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _shouldContinue = YES;
    }
    return self;
}

-(NSURLSessionDataTask *)startRequestWithCompletion:(KYRequestComplete)completion{ return nil; }

-(void)cancel{ }

@end
