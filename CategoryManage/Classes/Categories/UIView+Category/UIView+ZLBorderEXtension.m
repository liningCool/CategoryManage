//
//  UIView+ZPBorderEXtension.m
//  Zealer_zaaap!
//
//  Created by Xiaowen Zeng on 2020/2/21.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//

#import "UIView+ZLBorderEXtension.h"
 

@implementation UIView (ZLBorderEXtension)
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width{
    return self.frame.size.width;
}

-(void)setBorderWithTop:(BOOL)top Left:(BOOL)left Bottom:(BOOL)bottom Right:(BOOL)right BorderColor:(UIColor *)borderColor BorderWidth:(CGFloat)borderWidth{
    
    if (top) {
        CALayer *topBorder = [CALayer layer];
        topBorder.frame = CGRectMake(0, 0, self.width, borderWidth * 1.5);
        topBorder.backgroundColor = borderColor.CGColor;
        [self.layer addSublayer:topBorder];
    }
    
    if (left) {
        CALayer *leftBorder = [CALayer layer];
        leftBorder.frame = CGRectMake(0, 0, borderWidth * 1.5, self.height);
        leftBorder.backgroundColor = borderColor.CGColor;
        [self.layer addSublayer:leftBorder];
    }
    
    if (bottom) {
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0, self.height - borderWidth * 1.5, self.width, borderWidth * 1.5);
        bottomBorder.backgroundColor = borderColor.CGColor;
        [self.layer addSublayer:bottomBorder];
    }
    
    if (right) {
        CALayer *rightBorder = [CALayer layer];
        rightBorder.frame = CGRectMake(self.width - borderWidth * 1.5, 0, borderWidth * 1.5, self.height);
        rightBorder.backgroundColor = borderColor.CGColor;
        [self.layer addSublayer:rightBorder];
    }
    
}
@end
