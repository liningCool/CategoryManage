//
//  NSAttributedString+ZLSize.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/14.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (ZLSize)


/**
 *  NSAttributedString 字体大小计算
 *
 *  @return CGSize
 */
- (CGSize)zl_BoundingRect;

/**
 *  NSAttributedString  字体大小计算
 *
 *  @param size 指定字体范围
 *
 *  @return CGSize
 */
- (CGSize)zl_BoundingRectWithSize:(CGSize)size;

/**
 *  NSAttributedString  字体大小计算
 *
 *  @param size    指定字体范围
 *  @param options 字体模式
 *
 *  @return CGSize
 */
- (CGSize)zl_BoundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options;

/**
 *  计算高度
 *
 *  @param string 字符串
 *  @param width  限制最大宽度
 *
 *  @return 高度
 */
+ (CGFloat)zl_GetAttributedStringHeightWithString:(NSAttributedString *)string width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
