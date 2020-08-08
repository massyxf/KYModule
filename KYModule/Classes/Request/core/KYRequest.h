//
//  KYRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>

typedef void(^KYRequestComplete)(NSDictionary *_Nullable result,NSError *_Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface KYRequest : NSObject

-(void)cancel;

@end

NS_ASSUME_NONNULL_END
