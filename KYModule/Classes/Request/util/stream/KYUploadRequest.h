//
//  KYUploadRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import "KYRequest.h"
#import "KYUploadModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYUploadRequest : KYRequest

@property (nonatomic,copy)NSString *url;

@property (nonatomic,copy)NSDictionary *params;

///进度
@property (nonatomic,copy)void (^progressBlock)(float progress);

@property (nonatomic,strong)NSArray<KYUploadModelProtocol> *dataArray;

@end

NS_ASSUME_NONNULL_END
