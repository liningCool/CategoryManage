//
//  NSString+ZLBHexData.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "NSString+ZLHexData.h"

@implementation NSString (ZLHexData)


- (NSData *)dataFromHex
{
    NSMutableData *result = [[NSMutableData alloc] init];
    char buffer[3] = {'\0', '\0', '\0'};

    NSAssert(0 == [self length] % 2, @"Hex strings should have an even number of digits (%@)", self);

    for (NSUInteger i = 0; i < self.length / 2; i++) {
        buffer[0] = [self characterAtIndex:i * 2];
        buffer[1] = [self characterAtIndex:i * 2 + 1];
        unsigned char b = strtol(buffer, NULL, 16);
        [result appendBytes:&b length:1];
    }

    return result;
}

- (NSData *)hexToBytes
{
    NSMutableData *data = [NSMutableData data];
    int idx;

    for (idx = 0; idx + 2 <= self.length; idx += 2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString *hexStr = [self substringWithRange:range];
        NSScanner *scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }

    return data;
}

@end
