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

-(NSURLSessionTask *)startRequestWithCompletion:(KYRequestComplete)completion{
    void (^uploadCompleteBlock)(NSDictionary *,NSError *) = ^(NSDictionary *result,NSError *error){
        completion(self,result,error);
    };
    _task = [KYNetServiceManager uploadUrl:_url data:_dataArray params:_params progress:_progressBlock complete:uploadCompleteBlock];
    return _task;
}

-(void)cancel{
    [_task cancel];
}

@end
