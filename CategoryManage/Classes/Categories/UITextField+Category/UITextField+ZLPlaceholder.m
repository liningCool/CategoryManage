//
//  UITextField+ZLPlaceholder.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/12.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UITextField+ZLPlaceholder.h"

#import <objc/runtime.h>

char placeholderColorKey;
char placeholderFontKey;

@implementation UITextField (ZLPlaceholder)

- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, &placeholderColorKey);
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    // 将某个值跟某个对象关联起来，将某个值存储到某个对象中
    objc_setAssociatedObject(self, &placeholderColorKey, placeholderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIFont *)placeholderFont
{
    return objc_getAssociatedObject(self, &placeholderFontKey);
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    objc_setAssociatedObject(self, &placeholderFontKey, placeholderFont, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
