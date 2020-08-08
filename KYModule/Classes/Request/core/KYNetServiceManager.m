//
//  KYNetManager.m
//  KYNetKit
//
//  Created by yxf on 2018/7/9.
//  Copyright © 2018年 k_yan. All rights reserved.
//

#import "KYNetServiceManager.h"
#import "KYNetServiceConst.h"
#import <AFNetworking/AFHTTPSessionManager.h>
#import "KYModuleHeader.h"

@interface KYNetServiceManager ()

/*af manager*/
@property (nonatomic,strong)AFHTTPSessionManager *manager;

///header
@property (nonatomic,strong)NSMutableDictionary *headerParams;

@end

@implementation KYNetServiceManager

-(KYNetServiceConfig *)config{
    if (!_config) {
        _config = [[KYNetServiceConfig alloc] init];
    }
    return _config;
}

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        if ([_manager.responseSerializer isKindOfClass:[AFJSONResponseSerializer class]]) {
            ((AFJSONResponseSerializer *)_manager.responseSerializer).removesKeysWithNullValues = YES;
            _manager.responseSerializer.acceptableContentTypes = self.config.acceptTypes;
        }
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    _manager.requestSerializer.timeoutInterval = self.config.timeOut;
    [self setRequestHeader:self.headerParams];
    return _manager;
}

-(NSMutableDictionary *)headerParams{
    if (!_headerParams) {
        _headerParams = [NSMutableDictionary dictionary];
    }
    return _headerParams;
}


+(instancetype)shareInstance{
    static KYNetServiceManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

+(NSURLSessionDataTask *)postUrl:(NSString *)url params:(NSDictionary *)params complete:(void (^)(NSDictionary *, NSError *))complete{
   return [self requestUrl:url params:params type:KYRequestPost complete:complete];
}

+(NSURLSessionDataTask *)getUrl:(NSString *)url params:(NSDictionary *)params complete:(void (^)(NSDictionary *, NSError *))complete{
    return [self requestUrl:url params:params type:KYRequestGet complete:complete];
}

#pragma mark - custom func
+(NSURLSessionDataTask *)requestUrl:(NSString *)url
           params:(NSDictionary *)params
             type:(KYRequestType)type
         complete:(void (^)(NSDictionary *, NSError *))complete{
    KYNetServiceManager *serviceManager = [KYNetServiceManager shareInstance];
    void (^success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(responseObject,nil);
    };
    void (^fail)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(nil,error);
    };
    if (type == KYRequestPost) {
        return [serviceManager.manager POST:url
                                 parameters:params
                                   progress:nil
                                    success:success
                                    failure:fail];
    }else if (type == KYRequestGet){
        return [serviceManager.manager GET:url
                                parameters:params
                                  progress:nil
                                   success:success
                                   failure:fail];
    }
    KYLog(@"未知的请求类型");
    return nil;
}

+(NSURLSessionDataTask *)uploadUrl:(NSString *)url
                              data:(NSArray<KYUploadModelProtocol> *)obj
                            params:(NSDictionary *)params
                          progress:(void (^)(float))progress
                          complete:(void (^)(NSDictionary *, NSError *))complete{
    KYNetServiceManager *serviceManager = [KYNetServiceManager shareInstance];
    AFHTTPSessionManager *manager = serviceManager.manager;
    return [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (id<KYUploadModelProtocol>model in obj) {
            [formData appendPartWithFileData:model.data name:model.name fileName:model.filename mimeType:model.mimetype];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        !progress ? : progress(1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        KYLog(@"upload success:%@,%@",url,responseObject);
        !complete ? : complete(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        KYLog(@"upload fail:%@,%@",url,error);
        !complete ? : complete(nil,error);
    }];
}

+(NSURLSessionDownloadTask *)downloadUrl:(NSString *)url
                                progress:(void (^)(float))progress
                               cachePath:(NSString *)cachePath
                                complete:(void (^)(NSDictionary *, NSError *))complete{
    KYNetServiceManager *serviceManager = [KYNetServiceManager shareInstance];
    AFHTTPSessionManager *manager = serviceManager.manager;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        !progress ? : progress(1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:cachePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error) {
            !complete ? : complete(nil,error);
            return ;
        }
        !complete ? : complete(@{@"code":@"1"},nil);
    }];
    [task resume];
    return task;
}

-(void)setRequestHeader:(NSDictionary *)headerParams{
    [headerParams enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSString *obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            [_manager.requestSerializer setValue:obj forHTTPHeaderField:key];
        }
    }];
}

-(void)addRequestHeader:(NSDictionary *)dic{
    [self.headerParams addEntriesFromDictionary:dic];
}

-(void)removeRequestHeader:(NSArray<NSString *> *)headerParamKeys{
    [headerParamKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [_manager.requestSerializer setValue:nil forHTTPHeaderField:obj];
    }];
    [_headerParams removeObjectsForKeys:headerParamKeys];
}

@end


