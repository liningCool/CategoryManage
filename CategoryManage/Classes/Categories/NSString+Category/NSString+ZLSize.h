//
//  NSString+zlSize.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZLSize)

/**
 *  NSString 计算字体大小
 *
 *  @param font 字体
 *
 *  @return CGSize
 */
- (CGSize)zl_SizeWithFont:(UIFont *)font;

/**
 *  NSString 计算字体大小
 *
 *  @param font 字体
 *  @param size 计算字体大小范围
 *
 *  @return CGSize
 */
- (CGSize)zl_BoundingRectWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

/**
 *  NSString 计算字体大小
 *
 *  @param font          NSString 计算字体大小
 *  @param size          计算字体大小范围
 *  @param lineBreakMode 字体模式
 *
 *  @return CGSize
 */
- (CGSize)zl_BoundingRectWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;


/**
 *  根据字体计算size
 *
 *  @param font
 *  @param size
 *  @param lineBreakMode
 *
 *  @return
 */
- (CGSize)widthWithFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 *  根据字体计算宽度
 *
 *  @param font
 *
 *  @return
 */
- (CGFloat)widthWithFont:(UIFont *)font;

- (CGFloat)widthWithFont:(UIFont *)font width:(CGFloat)width;

- (CGFloat)heightWithFont:(UIFont *)font;

- (CGFloat)heightWithFont:(UIFont *)font width:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
