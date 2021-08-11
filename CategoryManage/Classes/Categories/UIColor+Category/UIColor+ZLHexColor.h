//
//  UIColor+ZLBHexColor.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ZLHexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHexString:(NSString *)hexColor;
+ (UIColor *)colorWithAlphaWithHexString:(NSString *)hexColor;

+ (UIColor *)colorWithHexString: (NSString *)color AndAlpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
