//
//  UIView+ClipCircle.h
//  JingXiMerchant
//
//  Created by os on 2019/9/4.
//  Copyright © 2019 jingxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZLClipCircle)

 

-(void)clipCircle:(CGFloat)radius;

-(void)clipCircle:(CGFloat)radius byRound:(UIRectCorner)corner;

//分割线
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal;
-(void)addBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor  closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable;
-(void)addTempBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor  closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable;
-(void)addWeekBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor  closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable;

@end

NS_ASSUME_NONNULL_END
