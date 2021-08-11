//
//  NSIndexPath+ZLStringValue.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/12/9.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSIndexPath (ZLStringValue)

- (NSString *)stringValue;

+ (instancetype)indexPathFromString:(NSString *)str;


@end

NS_ASSUME_NONNULL_END
