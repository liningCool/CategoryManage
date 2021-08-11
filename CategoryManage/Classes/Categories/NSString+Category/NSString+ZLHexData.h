//
//  NSString+ZLBHexData.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZLHexData)

/**
 *  16进制字符串转换为NSData
 *
 *  @return NSData数据
 */
- (NSData *)dataFromHex;

/**
 *  16进制字符串转换为NSData
 *
 *  @return NSData数据
 */
- (NSData *)hexToBytes;

@end

NS_ASSUME_NONNULL_END
