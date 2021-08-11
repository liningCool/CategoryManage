//
//  NSString+ZLBMd5.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <Foundation/Foundation.h>



@interface NSString (ZLMd5)

/**
 *  把字符串加密成32位小写md5字符串
 *
 *  @param inPutText 需要被加密的字符串
 *
 *  @return 加密后的32位小写md5字符串
 */
- (NSString *)md532BitLower;

/**
 *  把字符串加密成32位大写md5字符串
 *
 *  @param inPutText 需要被加密的字符串
 *
 *  @return 加密后的32位大写md5字符串
 */
- (NSString *)md532BitUpper;

/**
 *  把字符串加密成32位小写md5字符串
 *
 *  @return 加密后的32位md5字符串(无大小写转换)
 */
- (NSString *)md532Bit;


@end


