//
//  NDDownloadRequest.h
//  NDTruck
//
//  Created by yxf on 2019/12/12.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "KYRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYDownloadRequest : KYRequest

///url
@property (nonatomic,copy)NSString *url;

///缓存路径
@property (nonatomic,copy)NSString *cachedPath;

///进度
@property (nonatomic,copy)void (^progressBlock)(float progress);


@end

NS_ASSUME_NONNULL_END
