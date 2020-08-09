//
//  NDDownloadRequest.m
//  NDTruck
//
//  Created by yxf on 2019/12/12.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "KYDownloadRequest.h"
#import "KYNetServiceManager.h"

@interface KYDownloadRequest (){
    NSURLSessionDownloadTask *_task;
}

@end

@implementation KYDownloadRequest

-(NSString *)cachedPath{
    if (!_cachedPath) {
        NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
        _cachedPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@(time).stringValue];
    }
    return _cachedPath;
}

-(NSURLSessionTask *)startRequestWithCompletion:(KYRequestComplete)completion{
    void (^downloadCompleteBlock)(NSDictionary *,NSError *) = ^(NSDictionary *result,NSError *error){
        !completion ? : completion(self,result,error);
    };
    
    _task = [KYNetServiceManager downloadUrl:_url
                                    progress:_progressBlock
                                   cachePath:_cachedPath
                                    complete:downloadCompleteBlock];
    return _task;
}

-(void)cancelTask{
    [_task cancel];
}

@end
