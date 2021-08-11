//
//  NSString+ZLBEmptyData.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "NSString+ZLEmptyData.h"

@implementation NSString (ZLEmptyData)

+ (BOOL)isEmptyString:(NSString *)string
{
    if (!string || [string isKindOfClass:[NSNull class]] || ![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    else if ([string isEqualToString:@""]) {
        return YES;
    }

    return NO;
}

+ (NSString *)stringValue:(NSString *)string
{
    if (!string) {
        return @"";
    }

    if ([string isKindOfClass:[NSNumber class]]) {
        NSNumber *number = (NSNumber *)string;
        return [number stringValue];
    }

    if (![string isKindOfClass:[NSString class]]) {
        return @"";
    }

    return string;
}

@end
