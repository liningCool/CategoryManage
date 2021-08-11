//
//  UIImage+ZLStore.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2020/1/20.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//

#import "UIImage+ZLStore.h"

#import <objc/runtime.h>



@implementation UIImage (ZLStore)

- (NSString *)lmn_fileName
{
    return objc_getAssociatedObject(self, @selector(lmn_fileName));
}

- (void)setLmn_fileName:(NSString *)lmn_fileName
{
    objc_setAssociatedObject(self, @selector(lmn_fileName), lmn_fileName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
