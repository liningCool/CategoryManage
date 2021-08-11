//
//  UIView+ZLGradientColor.m
//  Zealer_zaaap!
//
//  Created by LiNing on 2021/4/16.
//  Copyright © 2021 Zealer_zaaap!. All rights reserved.
//

#import "UIView+ZLGradientColor.h"

@implementation UIView (ZLGradientColor)

- (void)setBackGroundGradientColorWithColorArr:(NSArray *)colorArr {
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.5), @(1.0)];//渐变点

    NSMutableArray *colorMuArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < colorArr.count; i++) {
        UIColor *normalColor = [colorArr objectAtIndex:i];

        [colorMuArr addObject:(id)normalColor.CGColor];
    }

    [gradientLayer setColors:colorMuArr];//渐变数组

//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    if ([self isKindOfClass:[UIButton class]]) {
        self.backgroundColor = UIColor.clearColor;
    }
    
}

@end
