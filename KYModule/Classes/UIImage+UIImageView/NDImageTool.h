//
//  NDImageTool.h
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NDImageTool : NSObject

+(BOOL)imageCached:(NSString *)imgUrl;

+(void)cacheImageInDisk:(UIImage *)image forUrl:(NSString *)url;

///从缓存中获取图片
+(UIImage *)memoryImgWithSize:(CGSize)size;

///清理图片缓存
+(void)clearImgMemoryCache;

@end

NS_ASSUME_NONNULL_END
