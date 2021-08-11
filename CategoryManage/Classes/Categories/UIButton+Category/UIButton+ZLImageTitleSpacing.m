//
//  UIButton+ImageTitleSpacing.m
//  Intelligent_Fire
//
//  Created by 高磊 on 2016/12/19.
//  Copyright © 2016年 高磊. All rights reserved.
//

#import "UIButton+ZLImageTitleSpacing.h"

@implementation UIButton (ZLImageTitleSpacing)

- (void)layoutButtonWithEdgeInsetsStyle:(GLButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space {
    /**
     *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
    // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值

    switch (style) {
        case GLButtonEdgeInsetsStyleTop:
        {            
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case GLButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case GLButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

-(void)adjustButtonImageViewUPTitleDownWithButton{
    [self layoutIfNeeded];
      //使图片和文字居左上角
      self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
      self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
      
      CGFloat buttonHeight = CGRectGetHeight(self.frame);
      CGFloat buttonWidth = CGRectGetWidth(self.frame);
      
      CGFloat ivHeight = CGRectGetHeight(self.imageView.frame);
      CGFloat ivWidth = CGRectGetWidth(self.imageView.frame);
      
      CGFloat titleHeight = CGRectGetHeight(self.titleLabel.frame);
      CGFloat titleWidth = CGRectGetWidth(self.titleLabel.frame);
      //调整图片
      float iVOffsetY = buttonHeight / 2.0 - (ivHeight + titleHeight) / 2.0;
      float iVOffsetX = buttonWidth / 2.0 - ivWidth / 2.0;
      [self setImageEdgeInsets:UIEdgeInsetsMake(iVOffsetY, iVOffsetX, 0, 0)];
      
      //调整文字
      float titleOffsetY = iVOffsetY + CGRectGetHeight(self.imageView.frame) + 10;
      float titleOffsetX = 0;
      if (CGRectGetWidth(self.imageView.frame) >= (CGRectGetWidth(self.frame) / 2.0)) {
          //如果图片的宽度超过或等于button宽度的一半
          titleOffsetX = -(ivWidth + titleWidth - buttonWidth / 2.0 - titleWidth / 2.0);
      }else {
          titleOffsetX = buttonWidth / 2.0 - ivWidth - titleWidth / 2.0;
      }
      [self setTitleEdgeInsets:UIEdgeInsetsMake(titleOffsetY , titleOffsetX, 0, 0)];
    
}




@end
