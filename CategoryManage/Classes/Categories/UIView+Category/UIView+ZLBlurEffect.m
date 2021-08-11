//
//  UIView+ZLBlurEffect.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/12.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UIView+ZLBlurEffect.h"
//#import "LFBlurEffect.h"


@implementation UIView (ZLBlurEffect)

- (void)blueEffectWithStyle:(UIBlurEffectStyle)style WithAlpha:(CGFloat)alpha
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
    {
        NSAssert(YES, @"Only support iOS 8.0+");
        return;
    }
    
//    UIBlurEffect *effect =  [UIBlurEffect effectWithStyle:style];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectview.alpha = alpha;
//    effectview.userInteractionEnabled = NO;
//    [self addSubview:effectview];
//
//    [effectview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.bottom.equalTo(self);
//    }];
//    [self insertSubview:effectview atIndex:0];
}

- (void)ZLblurEffectWithStyle:(UIBlurEffectStyle)style withRadius:(CGFloat)radius WithAlpha:(CGFloat)alpha{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
    {
        NSAssert(YES, @"Only support iOS 8.0+");
        return;
    }
    

//    LFBlurEffect * effect =[LFBlurEffect effectWithStyle:style withRadius:radius withScale:1.0 withAlpha:alpha];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectview.userInteractionEnabled = NO;
//
//    [self addSubview:effectview];
//
//    [effectview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.bottom.equalTo(self);
//    }];
//    [self insertSubview:effectview atIndex:0];
}

- (void)ZLblurEffectWithStyle:(UIBlurEffectStyle)style withRadius:(CGFloat)radius WithDarkNess:(CGFloat)drakness AndAlpha:(CGFloat)alpha{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0f)
    {
        NSAssert(YES, @"Only support iOS 8.0+");
        return;
    }
    
//    LFBlurEffect * effect =[LFBlurEffect effectWithStyle:style withRadius:radius withScale:1.0 withAlpha:drakness];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:effect];
//    effectview.userInteractionEnabled = NO;
//    [self addSubview:effectview];
//    effectview.alpha = alpha;
//    [effectview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.bottom.equalTo(self);
//    }];
//    [self insertSubview:effectview atIndex:0];
}


@end
