//
//  UIView+ZPFindSubView.h
//  Zealer_zaaap!
//
//  Created by LiNing on 2021/4/19.
//  Copyright © 2021 Zealer_zaaap!. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZLFindSubView)

- (UIView *)tkp_findSubview:(NSString *)name resursion:(BOOL)resursion;
@end

NS_ASSUME_NONNULL_END
