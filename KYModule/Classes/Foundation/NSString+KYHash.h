//
//  NSString+Hash.h
//
//  Created by Tom Corwine on 5/30/12..
//

#import <Foundation/Foundation.h>

@interface NSString (KYHash)

@property (readonly) NSString *ky_md5String;
@property (readonly) NSString *ky_sha1String;
@property (readonly) NSString *ky_sha256String;
@property (readonly) NSString *ky_sha512String;

- (NSMutableData *)ky_hmacSHA1DataWithKey:(NSString *)key;
- (NSString *)ky_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)ky_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)ky_hmacSHA512StringWithKey:(NSString *)key;

@end
