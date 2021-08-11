//
//  UIViewController+ZLBUtility.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIViewController (ZLUtility)

/**
 *  获取当前视图控制器
 *
 *  @return 视图控制器
 */
+ (UIViewController *)currentViewController;

/**
 *  获取当前视图控制器
 *
 *  @return 视图控制器
 */
+ (UIViewController *)getCurrentController;

/**
 *  获取当前视图控制器
 *
 *  @param window 窗口
 *
 *  @return 视图控制器
 */
+ (UIViewController *)currentViewControllerFromWindow:(UIWindow *)window;

@end


