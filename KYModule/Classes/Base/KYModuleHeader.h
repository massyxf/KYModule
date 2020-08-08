//
//  KYModuleHeader.h
//  Pods
//
//  Created by yxf on 2020/8/8.
//

#ifndef KYModuleHeader_h
#define KYModuleHeader_h

#ifdef DEBUG
#define KYLog(...)  NSLog(__VA_ARGS__)
#else
#define KYLog(...)
#endif

#define KYColorRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#endif /* KYModuleHeader_h */
