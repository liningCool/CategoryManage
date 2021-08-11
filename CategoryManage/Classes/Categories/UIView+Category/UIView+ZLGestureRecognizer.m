//
//  UIView+GestureRecognizer.m
//  KBDropdownController
//
//  Created by Jing Dai on 6/8/15.
//  Copyright (c) 2015 daijing. All rights reserved.
//

static void *kTapGestureKey = &kTapGestureKey;
static void *kLongGestureKey = &kLongGestureKey;

#import "UIView+ZLGestureRecognizer.h"
#import <objc/runtime.h>
@implementation UIView (ZLGestureRecognizer)


-(void)setLongTouchGestureWithBlock:(void (^)(void))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kLongGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForLongPress:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kLongGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kLongGestureKey, block, OBJC_ASSOCIATION_COPY);
    
}

- (void)setTapGestureWithBlock:(void (^)(void))block
{
    self.userInteractionEnabled=YES;
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kTapGestureKey, block, OBJC_ASSOCIATION_COPY);
}

-(void)handleActionForLongPress:(UILongPressGestureRecognizer *)longReconginzer{
    
    if (longReconginzer.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kLongGestureKey);
        
        if (action)
        {
            action();
        }
    }
    
}


- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kTapGestureKey);
        
        if (action)
        {
            action();
        }
    }
}


-(void)setPanGestureWithEndBlock:(void (^)(void))block{
    
    
    
    
    
}
- (dispatch_block_t)endDragBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setEndDragBlock:(dispatch_block_t)block{
    objc_setAssociatedObject(self, @selector(endDragBlock), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
