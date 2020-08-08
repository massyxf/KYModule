//
//  KYUploadRequest.m
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYUploadRequest.h"
#import "KYNetServiceManager.h"

@interface KYUploadRequest (){
    NSURLSessionDataTask *_task;
}

@end

@implementation KYUploadRequest

-(NSURLSessionDataTask *)startUploadRequest{
    _task = [KYNetServiceManager uploadUrl:_url data:_dataArray params:_params progress:_progressBlock complete:_completeBlock];
    return _task;
}

-(void)cancelTask{
    [_task cancel];
}

@end
