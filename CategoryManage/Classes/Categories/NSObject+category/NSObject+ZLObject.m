//
//  NSObject+ZLObject.m
//  Zealer.com
//
//  Created by Xiaowen Zeng on 2019/10/9.
//  Copyright © 2019 伍陶陶. All rights reserved.
//

#import "NSObject+ZLObject.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (ZLObject)
+ (void)load{
    
    SEL originalSelector = @selector(doesNotRecognizeSelector:);
    SEL swizzledSelector = @selector(sw_doesNotRecognizeSelector:);
    
    Method originalMethod = class_getClassMethod(self, originalSelector);
    Method swizzledMethod = class_getClassMethod(self, swizzledSelector);
    
    if(class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))){
        class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
#if TARGET_IPHONE_SIMULATOR
     if(@available(iOS 13.0, *)){
        Method origin = class_getClassMethod([UIDevice class], NSSelectorFromString(@"getUniqueStrByUUID"));
        //    IMP originImp = method_getImplementation(origin);
        
        Method swizz = class_getClassMethod([self class], @selector(swizz_getUniqueStrByUUID));
        //交换方法实现
        method_exchangeImplementations(origin, swizz);
    }
    
#endif

  
}

+ (void)sw_doesNotRecognizeSelector:(SEL)aSelector{
    //处理 _LSDefaults 崩溃问题
    if([[self description] isEqualToString:@"_LSDefaults"] && (aSelector == @selector(sharedInstance))){
        //冷处理...
        NSLog(@"ios 13 冷处理...");
        return;
    }
    [self sw_doesNotRecognizeSelector:aSelector];
}


#if TARGET_IPHONE_SIMULATOR
    #pragma mark - 获取唯一标识 新浪
    + (NSString *)swizz_getUniqueStrByUUID{
        CFUUIDRef  uuidObj = CFUUIDCreate(nil);//create a new UUID
        //get the string representation of the UUID
        NSString    *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
        CFRelease(uuidObj);
        return uuidString ;
    }
#endif

@end
