//
//  UILabel+Size.m
//  JingXiMerchant
//
//  Created by os on 2019/9/9.
//  Copyright © 2019 jingxi. All rights reserved.
//

#import "UILabel+ZLSize.h"

@implementation UILabel (ZLSize)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];

    label.text = title;

    label.font = font;

    label.numberOfLines = 0;

    [label sizeToFit];

    CGFloat height = label.frame.size.height;

    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    if ([title isKindOfClass:[NSNull class]] || !(title.length > 0)) {
        return 0;
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];

    label.text = title;

    label.font = font;

    [label sizeToFit];

    return label.frame.size.width;
}

+ (CGFloat)getWidthWithAttributeTitle:(NSString *)title attDic:(NSDictionary *)attDic{
    if ([title isKindOfClass:[NSNull class]] || !(title.length > 0)) {
        return 0;
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];

    NSAttributedString *attriSting = [[NSAttributedString alloc] initWithString:title attributes:attDic];
    
    label.attributedText = attriSting; 
    [label sizeToFit];

    return label.frame.size.width;
}

+ (CGFloat)getHeightWithWidth:(CGFloat)width attributeTitle:(NSString *)title attDic:(NSDictionary *)attDic{
    if ([title isKindOfClass:[NSNull class]] || !(title.length > 0)) {
        return 0;
    }

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.numberOfLines = 0;
    NSAttributedString *attriSting = [[NSAttributedString alloc] initWithString:title attributes:attDic];
    
    label.attributedText = attriSting;
    [label sizeToFit];

    return label.frame.size.height;
}

+ (CGFloat)getSpaceLabelHeight:(NSString *)str withAttrDict:(NSMutableDictionary *)dict withWidth:(CGFloat)width {
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size.height;
}

@end
