//
//  NSIndexPath+ZLStringValue.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/12/9.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "NSIndexPath+ZLStringValue.h"


@implementation NSIndexPath (ZLStringValue)

- (NSString *)stringValue
{
    NSMutableArray *array = @[].mutableCopy;
    
    for (NSUInteger i = 0; i < self.length; i++) {
        NSUInteger index = [self indexAtPosition:i];
        [array addObject:@(index)];
    }
    
    return [array componentsJoinedByString:@","];
}

+ (instancetype)indexPathFromString:(NSString *)str
{
    if (!str) {
        return nil;
    }
    
    NSArray *array = [str componentsSeparatedByString:@","];
    NSIndexPath *indexPath = [[NSIndexPath alloc] init];
    
    for (NSString *cmp in array) {
        NSUInteger index = [cmp integerValue];
        indexPath = [indexPath indexPathByAddingIndex:index];
    }
    
    return indexPath;
}

@end
