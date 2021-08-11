//
//  UIButton+GradientColor.m
//  JingXiMerchant
//
//  Created by os on 2019/9/29.
//  Copyright © 2019 jingxi. All rights reserved.
//

#import "UIButton+ZLGradientColor.h"

#define LRRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation UIButton (ZLGradientColor)
-(void)setNormalGradientWithColorArr:(NSArray *)colorArr{
    CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@(0.5),@(1.0)];//渐变点
    
    NSMutableArray *colorMuArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < colorArr.count; i++) {
        UIColor *normalColor = [colorArr objectAtIndex:i];
        
        [colorMuArr addObject:(id)normalColor.CGColor];
    }
    
    [gradientLayer setColors:colorMuArr];//渐变数组
    
//    [gradientLayer setColors:@[(id)[LRRGBColor(255, 141, 2) CGColor],(id)[LRRGBColor(254, 109, 18) CGColor]]];//渐变数组
//    [self.layer addSublayer:gradientLayer];
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
}
@end
