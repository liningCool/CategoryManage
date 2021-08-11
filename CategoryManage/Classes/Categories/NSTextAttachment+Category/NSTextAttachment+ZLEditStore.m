//
//  NSTextAttachment+ZLEditStore.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2020/2/7.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//

#import "NSTextAttachment+ZLEditStore.h"

#import <objc/runtime.h>

@implementation NSTextAttachment (ZLEditStore)

+ (void)load
{
    Method oldMethod = class_getInstanceMethod(self, @selector(initWithCoder:));
    Method newMethod = class_getInstanceMethod(self, @selector(zl_initWithCoder:));
    method_exchangeImplementations(oldMethod, newMethod);
    
    oldMethod = class_getInstanceMethod(self, @selector(encodeWithCoder:));
    newMethod = class_getInstanceMethod(self, @selector(zl_encodeWithCoder:));
    method_exchangeImplementations(oldMethod, newMethod);
}

- (instancetype)zl_initWithCoder:(NSCoder *)aDecoder
{
    NSTextAttachment *instance = [self zl_initWithCoder:aDecoder];
    if (instance) {
        instance.bounds = [aDecoder decodeCGRectForKey:@"bounds"];
    }
    return instance;
}

- (void)zl_encodeWithCoder:(NSCoder *)aCoder
{
    [self zl_encodeWithCoder:aCoder];
    [aCoder encodeCGRect:self.bounds forKey:@"bounds"];
}

@end
