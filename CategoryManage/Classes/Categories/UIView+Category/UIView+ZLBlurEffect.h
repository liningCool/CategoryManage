//
//  UIView+ZLBlurEffect.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/12.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//



#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZLBlurEffect)

/**
 *  添加毛玻璃效果[仅支持iOS 8.0+]
 *
 *  @param style style
 */
- (void)blueEffectWithStyle:(UIBlurEffectStyle)style WithAlpha:(CGFloat)alpha;

- (void)ZLblurEffectWithStyle:(UIBlurEffectStyle)style withRadius:(CGFloat)radius  WithAlpha:(CGFloat)alpha;

- (void)ZLblurEffectWithStyle:(UIBlurEffectStyle)style withRadius:(CGFloat)radius WithDarkNess:(CGFloat)drakness AndAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
