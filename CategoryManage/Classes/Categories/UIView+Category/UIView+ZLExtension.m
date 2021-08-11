//
//  UIView+LHExtension.m
//  LHDragViewDemo
//
//  Created by liuzhihua on 2018/11/19.
//  Copyright © 2018 TouchPal. All rights reserved.
//

#import "UIView+ZLExtension.h"
#import <objc/runtime.h>

@implementation UIView (ZLExtension)

- (void)dragWithBoundsInset:(UIEdgeInsets)dragBoundsInset beginDragBlock:(dispatch_block_t)beginBlock moveBlock:(ZLDragViewMoving)moveBlock endDragBlock:(ZLDragViewEndDrag)endBlock{
    if (dragBoundsInset.top >= 0&&
        dragBoundsInset.left >= 0&&
        dragBoundsInset.bottom >= 0&&
        dragBoundsInset.right >= 0) {
        self.dragBoundsInset = dragBoundsInset;
        self.dragViewOrigin = self.frame.origin;
        if (beginBlock) {
            self.beginDragBlock = beginBlock;
        }
        if (moveBlock) {
            self.moveBlock = moveBlock;
        }
        if (endBlock) {
            self.endDragBlock = endBlock;
        }
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:pan];
    }
}

- (void)setOutDirection:(ZLViewOutDirection)direction backToOriginMoveInset:(UIEdgeInsets)inset{
    self.dragDirection = direction;
    self.dragInset = inset;
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGPoint p = [pan locationInView:self.superview];
    if (pan.state == UIGestureRecognizerStateBegan) {
        if (self.beginDragBlock) {
            self.beginDragBlock();
        }
    }else if (pan.state == UIGestureRecognizerStateChanged){
        CGFloat deltaY = p.y - self.dragViewOldPoint.y;
        CGFloat deltaX = p.x - self.dragViewOldPoint.x;
        CGRect rect = self.frame;
        CGFloat curY = rect.origin.y;
        curY += deltaY;
        CGFloat curX = rect.origin.x;
        curX += deltaX;
        if (curY > self.dragRect.origin.y&&
            curY + self.bounds.size.height < CGRectGetMaxY(self.dragRect)) {
            rect.origin.y = curY;
        }
        if (curX > self.dragRect.origin.x&&
            curX + self.bounds.size.width < CGRectGetMaxX(self.dragRect)) {
            rect.origin.x = curX;
        }
        self.frame = rect;
        if (self.moveBlock) {
            self.moveBlock(CGPointMake(deltaX, deltaY));
        }
    }else {
        if ([self dragViewDisable]) {
            if (self.endDragBlock) {
                self.endDragBlock(NO,0);
            }
            return;
        }
        CGRect rect = self.frame;
        if (self.dragDirection&ZLViewOutDirectionRight&&
            rect.origin.x - self.dragViewOrigin.x > self.dragInset.right) {
//            if ([self outInset].right) {
//                rect.origin.x = [self dragViewOrigin].x + [self outInset].right;
//            }else{
//                rect.origin.x = CGRectGetMaxX(self.dragRect);
//            }
            
//            NSTimeInterval interval = [self startAnimateToFrame:rect direction:ZLViewOutDirectionRight];
            if (self.endDragBlock) {
                self.endDragBlock(YES,0);
            }
        }else if (self.dragDirection&ZLViewOutDirectionLeft&&
                  rect.origin.x - self.dragViewOrigin.x < -self.dragInset.left) {
//            if ([self outInset].left) {
//                rect.origin.x = [self dragViewOrigin].x - [self outInset].left;
//            }else{
//                rect.origin.x = CGRectGetMinX(self.dragRect) - self.bounds.size.width;
//            }
//            NSTimeInterval interval = [self startAnimateToFrame:rect direction:ZLViewOutDirectionLeft];
            if (self.endDragBlock) {
                self.endDragBlock(YES,0);
            }
        }else if (self.dragDirection&ZLViewOutDirectionTop&&
                  self.dragViewOrigin.y - rect.origin.y > self.dragInset.top) {
//            if ([self outInset].top) {
//                rect.origin.y = [self dragViewOrigin].y - [self outInset].top;
//            }else{
//                rect.origin.y = CGRectGetMinY(self.dragRect) - self.bounds.size.height;
//            }
//            NSTimeInterval interval = [self startAnimateToFrame:rect direction:ZLViewOutDirectionTop];
            if (self.endDragBlock) {
                self.endDragBlock(YES,0);
            }
        }else if (self.dragDirection&ZLViewOutDirectionBottom&&
                  rect.origin.y - self.dragViewOrigin.y > self.dragInset.bottom) {
//            if ([self outInset].bottom) {
//                rect.origin.y = [self dragViewOrigin].y + [self outInset].bottom;
//            }else{
//                rect.origin.y = CGRectGetMaxY(self.dragRect);
//            }
//            NSTimeInterval interval = [self startAnimateToFrame:rect direction:ZLViewOutDirectionBottom];
            if (self.endDragBlock) {
                self.endDragBlock(YES,0);
            }
        }else{
//            rect.origin.x = self.dragViewOrigin.x;
//            rect.origin.y = self.dragViewOrigin.y;
//            NSTimeInterval interval = [self startAnimateToFrame:rect direction:ZLViewOutDirectionNone];
            if (self.endDragBlock) {
                self.endDragBlock(NO,0);
            }
        }
        
    }
    self.dragViewOldPoint = p;
}

- (void)setDragViewUpMoveDisable:(BOOL)disable{
    objc_setAssociatedObject(self, @selector(dragViewDisable), @(disable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)dragViewDisable{
    BOOL dragViewDisable = [objc_getAssociatedObject(self, _cmd) boolValue];
    return dragViewDisable;
}

- (void)setDismissDuration:(NSTimeInterval)timeInterval{
    objc_setAssociatedObject(self, @selector(dismissDuration), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)dismissDuration{
    NSTimeInterval interval = [objc_getAssociatedObject(self, _cmd) floatValue];
    return interval > 0 ? interval : 0.3;
}

- (NSTimeInterval)startAnimateToFrame:(CGRect)frame direction:(ZLViewOutDirection)direction{
    NSTimeInterval interval = self.dismissDuration;
    switch (direction) {
        case ZLViewOutDirectionNone:{
            BOOL directionLeft = self.frame.origin.x < frame.origin.x;
            BOOL directionTop = self.frame.origin.y < frame.origin.y;
            CGFloat horizontalInterval = 0,verticalInterval = 0;
            if (directionLeft&&[self dragBoundsInset].left > 0) {
                CGFloat curDeltaX = fabs(self.frame.origin.x - frame.origin.x);
                horizontalInterval = curDeltaX * interval/([self dragBoundsInset].left + self.bounds.size.width);
            }else if(!directionLeft&&[self dragBoundsInset].right > 0){
                CGFloat curDeltaX = fabs(self.frame.origin.x - frame.origin.x);
                horizontalInterval = curDeltaX * interval/([self dragBoundsInset].right + self.bounds.size.width);
            }
            
            if (directionTop&&[self dragBoundsInset].top > 0) {
                CGFloat curDeltaX = fabs(self.frame.origin.y - frame.origin.y);
                verticalInterval = curDeltaX * interval/([self dragBoundsInset].top + self.bounds.size.height);
            }else if(!directionTop&&[self dragBoundsInset].bottom > 0){
                CGFloat curDeltaY = fabs(self.frame.origin.y - frame.origin.y);
                verticalInterval = curDeltaY * interval/([self dragBoundsInset].bottom + self.bounds.size.height);
            }
            
            interval = horizontalInterval > verticalInterval ? horizontalInterval : verticalInterval;
            interval = interval > 0 ? interval : self.dismissDuration;
        }
            
            break;
        case ZLViewOutDirectionTop:{
            CGFloat curDeltaY = fabs(self.frame.origin.y - frame.origin.y);
            interval = curDeltaY * interval/([self dragBoundsInset].top + self.bounds.size.height);
        }
            
            break;
        case ZLViewOutDirectionLeft:{
            CGFloat curDeltaX = fabs(self.frame.origin.x - frame.origin.x);
            interval = curDeltaX * interval/([self dragBoundsInset].left + self.bounds.size.width);
        }
            
            break;
        case ZLViewOutDirectionBottom:{
            CGFloat curDeltaY = fabs(self.frame.origin.y - frame.origin.y);
            interval = curDeltaY * interval/([self dragBoundsInset].bottom + self.bounds.size.height);
        }
            
            break;
        case ZLViewOutDirectionRight:{
            CGFloat curDeltaX = fabs(self.frame.origin.x - frame.origin.x);
            interval = curDeltaX * interval/([self dragBoundsInset].right + self.bounds.size.width);
        }
            
            break;
        default:
            break;
    }
    [UIView animateWithDuration:interval animations:^{
        self.frame = frame;
    }];
    
    return interval;
}

- (ZLViewOutDirection)dragDirection{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setDragDirection:(ZLViewOutDirection)dragDirection{
    objc_setAssociatedObject(self, @selector(dragDirection), @(dragDirection), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)outInset{
    return [objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];
}

- (void)setDragOutFrameInset:(UIEdgeInsets)outInset{
    NSValue *v = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    if (outInset.top >= 0&&
        outInset.left >= 0&&
        outInset.bottom >= 0&&
        outInset.right >= 0) {
        v = [NSValue valueWithUIEdgeInsets:outInset];
    }
    objc_setAssociatedObject(self, @selector(outInset), v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (UIEdgeInsets)dragInset{
    return [objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];
}

- (void)setDragInset:(UIEdgeInsets)dragInset{
    NSValue *v = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero];
    if (dragInset.top >= 0&&
        dragInset.left >= 0&&
        dragInset.bottom >= 0&&
        dragInset.right >= 0) {
        v = [NSValue valueWithUIEdgeInsets:dragInset];
    }
    objc_setAssociatedObject(self, @selector(dragInset), v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_block_t)beginDragBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBeginDragBlock:(dispatch_block_t)block{
    objc_setAssociatedObject(self, @selector(beginDragBlock), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZLDragViewMoving)moveBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMoveBlock:(ZLDragViewMoving)block{
    objc_setAssociatedObject(self, @selector(moveBlock), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ZLDragViewEndDrag)endDragBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEndDragBlock:(ZLDragViewEndDrag)block{
    objc_setAssociatedObject(self, @selector(endDragBlock), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)dragBoundsInset{
    return [objc_getAssociatedObject(self, _cmd) UIEdgeInsetsValue];
}

- (void)setDragBoundsInset:(UIEdgeInsets)dragBoundsInset{
    NSValue *v = [NSValue valueWithUIEdgeInsets:dragBoundsInset];
    objc_setAssociatedObject(self, @selector(dragBoundsInset), v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)dragRect{
    UIEdgeInsets boundsInset = self.dragBoundsInset;
    CGRect dragRect = CGRectMake(self.dragViewOrigin.x - boundsInset.left, self.dragViewOrigin.y - boundsInset.top, self.bounds.size.width + boundsInset.left + boundsInset.right, self.bounds.size.height + boundsInset.top + boundsInset.bottom);
    return dragRect;
}

- (CGPoint)dragViewOrigin{
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setDragViewOrigin:(CGPoint)dragViewOrigin{
    NSValue *v = [NSValue valueWithCGPoint:dragViewOrigin];
    objc_setAssociatedObject(self, @selector(dragViewOrigin), v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGPoint)dragViewOldPoint{
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setDragViewOldPoint:(CGPoint)dragViewOldPoint{
    NSValue *v = [NSValue valueWithCGPoint:dragViewOldPoint];
    objc_setAssociatedObject(self, @selector(dragViewOldPoint), v, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
