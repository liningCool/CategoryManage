//
//  UIView+ClipCircle.m
//  JingXiMerchant
//
//  Created by os on 2019/9/4.
//  Copyright © 2019 jingxi. All rights reserved.
//

#import "UIView+ZLClipCircle.h"

@implementation UIView (ZLClipCircle)
- (void)clipCircle:(CGFloat)radius {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    self.layer.magnificationFilter = kCAFilterNearest;
    self.layer.contentsScale = [[UIScreen mainScreen] scale];
}

- (void)clipCircle:(CGFloat)radius byRound:(UIRectCorner)corner {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

/**
 *  通过 CAShapeLayer 方式绘制虚线
 *
 *  param lineView:       需要绘制成虚线的view
 *  param lineLength:     虚线的宽度
 *  param lineSpacing:    虚线的间距
 *  param lineColor:      虚线的颜色
 *  param lineDirection   虚线的方向  YES 为水平方向， NO 为垂直方向
 **/
- (void)drawLineOfDashByCAShapeLayer:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor lineDirection:(BOOL)isHorizonal {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];

    [shapeLayer setBounds:lineView.bounds];

    if (isHorizonal) {
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    } else {
        [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame) / 2)];
    }

    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    if (isHorizonal) {
        [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    } else {
        [shapeLayer setLineWidth:CGRectGetWidth(lineView.frame)];
    }
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);

    if (isHorizonal) {
        CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    } else {
        CGPathAddLineToPoint(path, NULL, 0, CGRectGetHeight(lineView.frame));
    }

    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

- (void)addBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable {
    static CAShapeLayer *lastShapeLayer = nil;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    if (clearEnable) {
        aPath.accessibilityValue = @"clear";
    }
    if ([self.layer.sublayers containsObject:lastShapeLayer]) {
        [lastShapeLayer removeFromSuperlayer];
    }

    //开始点 从上左下右的点
    if (pointArr) {
        for (NSInteger k = 0; k < pointArr.count; k++) {
            CGPoint point = [[pointArr objectAtIndex:k] CGPointValue];
            if (k == 0) {
                [aPath moveToPoint:point];
            } else {
                [aPath addLineToPoint:point];
            }
        }
    }
    if (closePath) {
        [aPath closePath];
    }
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //设置边框颜色
    shapelayer.strokeColor = [strokeColor CGColor];
    shapelayer.fillColor = [fillColor CGColor];
    shapelayer.lineWidth = width;
    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
    shapelayer.path = aPath.CGPath;
    [self.layer addSublayer:shapelayer];
    lastShapeLayer = shapelayer;
}

- (void)addTempBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable {
    static CAShapeLayer *lastShapeLayer = nil;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    if (clearEnable) {
        aPath.accessibilityValue = @"clear";
    }
    if ([self.layer.sublayers containsObject:lastShapeLayer]) {
        [lastShapeLayer removeFromSuperlayer];
    }

    //开始点 从上左下右的点
    if (pointArr) {
        for (NSInteger k = 0; k < pointArr.count; k++) {
            CGPoint point = [[pointArr objectAtIndex:k] CGPointValue];
            if (k == 0) {
                [aPath moveToPoint:point];
            } else {
                [aPath addLineToPoint:point];
            }
        }
    }
    if (closePath) {
        [aPath closePath];
    }
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //设置边框颜色
    shapelayer.strokeColor = [strokeColor CGColor];
    shapelayer.fillColor = [fillColor CGColor];
    shapelayer.lineWidth = width;
    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
    shapelayer.path = aPath.CGPath;
    [self.layer addSublayer:shapelayer];
    lastShapeLayer = shapelayer;
}

- (void)addWeekBezierPath:(NSArray *)pointArr lineWidth:(CGFloat)width fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor closePath:(BOOL)closePath needClearPath:(BOOL)clearEnable {
    static CAShapeLayer *lastShapeLayer = nil;
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    if (clearEnable) {
        aPath.accessibilityValue = @"clear";
    }
    if ([self.layer.sublayers containsObject:lastShapeLayer]) {
        [lastShapeLayer removeFromSuperlayer];
    }

    //开始点 从上左下右的点
    if (pointArr) {
        for (NSInteger k = 0; k < pointArr.count; k++) {
            CGPoint point = [[pointArr objectAtIndex:k] CGPointValue];
            if (k == 0) {
                [aPath moveToPoint:point];
            } else {
                [aPath addLineToPoint:point];
            }
        }
    }
    if (closePath) {
        [aPath closePath];
    }
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //设置边框颜色
    shapelayer.strokeColor = [strokeColor CGColor];
    shapelayer.fillColor = [fillColor CGColor];
    shapelayer.lineWidth = width;
    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
    shapelayer.path = aPath.CGPath;
    [self.layer addSublayer:shapelayer];
    lastShapeLayer = shapelayer;
}

@end
