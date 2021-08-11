//
//  UIViewController+ZLBUtility.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UIViewController+ZLUtility.h"


@implementation UIViewController (ZLUtility)

/**
 *  递归查找UIViewController
 *
 *  @param vc 控制器参数
 *
 *  @return 当前显示的控制器
 */
+ (UIViewController *)findBestViewController:(UIViewController *)vc
{
    if (vc.presentedViewController) {
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
    }
    else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController *)vc;

        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        }
        else {
            return vc;
        }
    }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)vc;

        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.topViewController];
        }
        else {
            return vc;
        }
    }
    else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController *)vc;

        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.selectedViewController];
        }
        else {
            return vc;
        }
    }
    else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

+ (UIViewController *)currentViewController
{
    // Find best view controller
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    UIViewController *viewController = [UIViewController windowForTopViewController:window];

    return [UIViewController findBestViewController:viewController];
}


+ (UIViewController *)getCurrentController
{
    // Find best view controller
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIViewController *viewController = [UIViewController windowForTopViewController:window];
    
    return [UIViewController findBestViewController:viewController];
}


+ (UIViewController *)currentViewControllerFromWindow:(UIWindow *)window
{
    // Find best view controller
    UIViewController *viewController = [UIViewController windowForTopViewController:window];

    return [UIViewController findBestViewController:viewController];
}

/**
 *  获得当前window显示的最顶部的viewcontroller
 *
 *  @return 顶部控制器
 */
+ (UIViewController *)windowForTopViewController:(UIWindow *)topWindow
{
    if (topWindow == nil) {
        return nil;
    }
    UIViewController *result;

    // Try to find the root view controller programmically

    // Find the top window (that is not an alert view or other window)

    if (topWindow.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];

        for (topWindow in windows) {
            if (topWindow.windowLevel == UIWindowLevelNormal) {
                break;
            }
        }
    }

    UIView *rootView = [[topWindow subviews] firstObject];

    if (rootView == nil) {
        return nil;
    }
    id nextResponder = [rootView nextResponder];

    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    }
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && (topWindow.rootViewController != nil)) {
        result = topWindow.rootViewController;
    }
    else {
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
    }

    return result;
}

@end
