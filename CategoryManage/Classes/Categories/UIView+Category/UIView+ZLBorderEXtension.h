//
//  UIView+ZPBorderEXtension.h
//  Zealer_zaaap!
//
//  Created by Xiaowen Zeng on 2020/2/21.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//

 

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZLBorderEXtension)
 

@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat width;

-(void)setBorderWithTop:(BOOL)top
                   Left:(BOOL)left
                 Bottom:(BOOL)bottom
                  Right:(BOOL)right
            BorderColor:(UIColor *)borderColor
            BorderWidth:(CGFloat)borderWidth;

 
@end

NS_ASSUME_NONNULL_END
