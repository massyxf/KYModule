//
//  NDDownloadRequest.h
//  NDTruck
//
//  Created by yxf on 2019/12/12.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KYDownloadRequest : NSObject

///url
@property (nonatomic,copy)NSString *url;

///缓存路径
@property (nonatomic,copy)NSString *cachedPath;

///进度
@property (nonatomic,copy)void (^progressBlock)(float progress);

///完成的回调
@property (nonatomic,copy)void (^completeBlock)(NSDictionary *result, NSError *error);

-(NSURLSessionDownloadTask *)startDownloadRequest;

-(void)cancelTask;

@end

NS_ASSUME_NONNULL_END
