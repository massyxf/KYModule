//
//  KYNetServiceConfig.m
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYNetServiceConfig.h"

@implementation KYNetServiceConfig

-(NSTimeInterval)timeOut{
    if (!_timeOut) {
        return 30;
    }
    return _timeOut;
}

-(NSSet *)acceptTypes{
    if (!_acceptTypes) {
        _acceptTypes = [NSSet setWithObjects:@"application/json",
                        @"text/json",
                        @"text/javascript",
                        @"text/html",
                        nil];
    }
    return _acceptTypes;
}

@end
