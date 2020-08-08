//
//  KYGroupRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>
#import "KYNormalRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface KYGroupRequest : NSObject

-(instancetype)initWithRequestArr:(NSArray<KYNormalRequest *> *)requestArr endRequest:(KYNormalRequest *_Nullable)request;

-(void)startGroupRequestsWithRequestComplete:(nullable void(^)(KYNormalRequest *request,NSDictionary *result,NSError *error))requestComplete
                               groupComplete:(nullable void(^)(void))groupComplete;

-(void)cancel;

@end

NS_ASSUME_NONNULL_END
