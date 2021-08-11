//
//  UIView+ZLShadow.h
//  Zealer_zaaap!
//
//  Created by z on 2020/4/8.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum :NSInteger{
    ZLShadowPathLeft,
    ZLShadowPathRight,
    ZLShadowPathTop,
    ZLShadowPathBottom,
    ZLShadowPathNoTop,
    ZLShadowPathAllSide

} ZLShadowPathSide;


@interface UIView (ZLShadow)

-(void)ZL_SetShadowPathWith:(UIColor *)shadowColor shadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius shadowSide:(ZLShadowPathSide)shadowPathSide shadowPathWidth:(CGFloat)shadowPathWidth;

@end

NS_ASSUME_NONNULL_END
