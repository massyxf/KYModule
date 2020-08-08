//
//  NDImageTool.m
//  NDTruck
//
//  Created by yxf on 2019/11/4.
//  Copyright © 2019 k_yan. All rights reserved.
//

#import "NDImageTool.h"
#import <SDWebImage/SDImageCache.h>
#import "UIImage+Extern.h"
#import "KYModuleHeader.h"

@interface NDImageTool ()

@end

@implementation NDImageTool

NSCache *imgCache(){
    static dispatch_once_t onceToken;
    static NSCache *cache = nil;
    dispatch_once(&onceToken, ^{
        cache = [[NSCache alloc] init];
    });
    return cache;
}

+(BOOL)imageCached:(NSString *)imgUrl{
    NSString *key = [imgUrl copy];
    return [[SDImageCache sharedImageCache] diskImageDataExistsWithKey:key];
}

+(void)cacheImageInDisk:(UIImage *)image forUrl:(nonnull NSString *)url{
    [[SDImageCache sharedImageCache] storeImage:image
                                         forKey:url
                                     completion:nil];
}

///从缓存中获取图片
+(UIImage *)memoryImgWithSize:(CGSize)size{
    NSString *sizeStr = NSStringFromCGSize(size);
    UIImage *image = [imgCache() objectForKey:sizeStr];
    if (!image) {
        image = [UIImage imageFromContextWithColor:KYColorRGB(0xE5E5EA) size:size];
        [imgCache() setObject:image forKey:sizeStr];
    }
    return image;
}

///清理图片缓存
+(void)clearImgMemoryCache{
    [imgCache() removeAllObjects];
}






@end
