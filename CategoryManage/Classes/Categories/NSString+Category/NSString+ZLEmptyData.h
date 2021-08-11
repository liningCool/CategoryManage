//
//  NSString+ZLBEmptyData.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZLEmptyData)

+ (BOOL)isEmptyString:(NSString *)string;

+ (NSString *)stringValue:(NSString *)string;


@end

NS_ASSUME_NONNULL_END
