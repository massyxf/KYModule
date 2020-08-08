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

-(NSURLSessionDownloadTask *)startDownloadRequest{
    __weak typeof(self) weakSelf = self;
    _task = [KYNetServiceManager downloadUrl:_url
                                    progress:_progressBlock
                                   cachePath:_cachedPath
                                    complete:^(NSDictionary *result, NSError *error) {
        if (error.code == NSURLErrorCancelled || !weakSelf) {
            return ;
        }
        weakSelf.completeBlock(result, error);
    }];
    return _task;
}

-(void)cancelTask{
    [_task cancel];
}

@end
