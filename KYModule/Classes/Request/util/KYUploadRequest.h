//
//  KYUploadRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>
#import "KYUploadModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYUploadRequest : NSObject

@property (nonatomic,copy)NSString *url;

@property (nonatomic,copy)NSDictionary *params;

///进度
@property (nonatomic,copy)void (^progressBlock)(float progress);

///完成的回调
@property (nonatomic,copy)void (^completeBlock)(NSDictionary *result, NSError *error);

@property (nonatomic,strong)NSArray<KYUploadModelProtocol> *dataArray;

-(NSURLSessionDataTask *)startUploadRequest;

-(void)cancelTask;

@end

NS_ASSUME_NONNULL_END
