//
//  NSAttributedString+ZLSize.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/14.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "NSAttributedString+ZLSize.h"

#import <CoreText/CoreText.h>


@implementation NSAttributedString (ZLSize)

- (CGSize)zl_BoundingRect
{
    CGFloat boundWidth = [[UIScreen mainScreen] bounds].size.width;
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(boundWidth, MAXFLOAT)
        options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
        context:nil];
        
    return rect.size;
}

- (CGSize)zl_BoundingRectWithSize:(CGSize)size
{
    CGRect rect = [self boundingRectWithSize:size
        options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
        context:nil];
        
    return rect.size;
}

- (CGSize)zl_BoundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options
{
    CGRect rect = [self boundingRectWithSize:size
        options:options
        context:nil];
        
    return rect.size;
}

+ (CGFloat)zl_GetAttributedStringHeightWithString:(NSAttributedString *)string width:(CGFloat)width
{
    CGFloat total_height = 0;
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);  //string 为要计算高度的NSAttributedString
    CGRect drawingRect = CGRectMake(0, 0, width, 1000);                                                     //这里的高要设置足够大
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, drawingRect);
    CTFrameRef textFrame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CGPathRelease(path);
    CFRelease(framesetter);
    
    NSArray *linesArray = (NSArray *)CTFrameGetLines(textFrame);
    
    CGPoint origins[[linesArray count]];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0, 0), origins);
    
    CGFloat line_y = (CGFloat)origins[[linesArray count] - 1].y; //最后一行line的原点y坐标
    
    CGFloat ascent;
    CGFloat descent;
    CGFloat leading;
    
    CTLineRef line = (__bridge CTLineRef)[linesArray objectAtIndex:[linesArray count] - 1];
    CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    
    total_height = 1000 - line_y + (CGFloat)descent + 1; //+1为了纠正descent转换成int小数点后舍去的值
    
    CFRelease(textFrame);
    
    return ceil(total_height);
}


@end
