//
//  UIView+ZPFindSubView.m
//  Zealer_zaaap!
//
//  Created by LiNing on 2021/4/19.
//  Copyright © 2021 Zealer_zaaap!. All rights reserved.
//

#import "UIView+ZLFindSubView.h"

@implementation UIView (ZLFindSubView)

- (UIView *)tkp_findSubview:(NSString *)name resursion:(BOOL)resursion {
    Class class = NSClassFromString(name);
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:class]) {
            return subview;
        }
    }

    if (resursion) {
        for (UIView *subview in self.subviews) {
            UIView *tempView = [subview tkp_findSubview:name resursion:resursion];
            if (tempView) {
                return tempView;
            }
        }
    }

    return nil;
}

@end
