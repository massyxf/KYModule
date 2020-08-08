//
//  KYRequest.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>

@class KYRequest;
typedef void(^KYRequestComplete)(KYRequest *_Nullable request,NSDictionary *_Nullable result,NSError *_Nullable error);
typedef void(^KYRequestVoidComplete)(void);

NS_ASSUME_NONNULL_BEGIN

@interface KYRequest : NSObject

///加入链式请求时，请求错误，是否进行下一条请求,默认为yes
@property (nonatomic,assign)BOOL shouldContinue;

-(NSURLSessionDataTask *)startRequestWithCompletion:(KYRequestComplete)completion;

-(void)cancel;

@end

NS_ASSUME_NONNULL_END
