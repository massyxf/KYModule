//
//  KYUploadModelProtocol.h
//  AFNetworking
//
//  Created by yxf on 2020/8/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KYUploadModelProtocol <NSObject>

/*data*/
@property (nonatomic,copy)NSData *data;

/*name*/
@property (nonatomic,copy)NSString *name;

/*file name*/
@property (nonatomic,copy)NSString *filename;

/*mime type*/
@property (nonatomic,copy)NSString *mimetype;

@end

NS_ASSUME_NONNULL_END
