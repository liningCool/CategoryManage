//
//  UILabel+Size.h
//  JingXiMerchant
//
//  Created by os on 2019/9/9.
//  Copyright © 2019 jingxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ZLSize)
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;
+ (CGFloat)getWidthWithAttributeTitle:(NSString *)title attDic:(NSDictionary *)attDic;
+ (CGFloat)getHeightWithWidth:(CGFloat)width attributeTitle:(NSString *)title attDic:(NSDictionary *)attDic;
+(CGFloat)getSpaceLabelHeight:(NSString *)str withAttrDict:(NSMutableDictionary *)dict withWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
