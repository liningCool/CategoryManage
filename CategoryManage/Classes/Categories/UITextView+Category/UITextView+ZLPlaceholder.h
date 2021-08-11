//
//  UITextView+ZLPlaceholder.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/12.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (ZLPlaceholder)

/**
 *  占位符Label
 */
@property (nonatomic, readonly) UILabel *placeholderLabel;

/**
 *  占位符内容
 */
@property (nonatomic, strong) NSString *placeholder;

/**
 *  占位符颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 *  占位符颜色
 */
@property (nonatomic, strong) UIFont *placeholderFont;

@end


