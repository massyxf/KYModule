//
//  KYNetManager.h
//  KYNetKit
//
//  Created by yxf on 2018/7/9.
//  Copyright © 2018年 k_yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KYUploadModelProtocol.h"
#import "KYNetServiceConfig.h"

@class AFHTTPSessionManager;
@interface KYNetServiceManager : NSObject

/*config*/
@property (nonatomic,strong)KYNetServiceConfig *config;

/*af manager*/
@property (nonatomic,strong,readonly)AFHTTPSessionManager *manager;

+(instancetype)shareInstance;

+(NSURLSessionDataTask *)postUrl:(NSString *)url
                          params:(NSDictionary *)params
                        complete:(void (^)(NSDictionary *result,NSError *error))complete;

+(NSURLSessionDataTask *)getUrl:(NSString *)url
                         params:(NSDictionary *)params
                       complete:(void (^)(NSDictionary *result,NSError *error))complete;

+(NSURLSessionDataTask *)uploadUrl:(NSString *)url
                              data:(NSArray<KYUploadModelProtocol> *)obj
                            params:(NSDictionary *)params
                          progress:(void (^)(float progress))progress
                          complete:(void (^)(NSDictionary *result,NSError *error))complete;

+(NSURLSessionDownloadTask *)downloadUrl:(NSString *)url
                                progress:(void (^)(float progress))progress
                               cachePath:(NSString *)cachePath
                                complete:(void (^)(NSDictionary *result,NSError *error))complete;

-(void)addRequestHeader:(NSDictionary *)dic;
-(void)removeRequestHeader:(NSArray<NSString *> *)headerParamKeys;

@end
