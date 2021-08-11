//
//  UIViewController+zlLog.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UIViewController+ZLLog.h"

/// other
#import <objc/runtime.h>


@implementation UIViewController (ZLLog)

+ (void)load
{
    //只进行一次操作,保证线程安全
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        Method originalMethod = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method swizzledMethod = class_getInstanceMethod(self, @selector(zl_viewDidLoad));

        BOOL didAddMethod = class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod([self class], @selector(zl_viewDidLoad), method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)zl_viewDidLoad
{
    [self zl_viewDidLoad];

    if (!([self isMemberOfClass:[UIViewController class]] || [self isMemberOfClass:[UINavigationController class]] || [self isKindOfClass:NSClassFromString(@"UIInputWindowController")])) {
        NSLog(@"当前控制器 >>>>> %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}


@end
