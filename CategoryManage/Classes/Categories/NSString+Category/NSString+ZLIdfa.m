//
//  NSString+ZLBIdfa.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "NSString+ZLIdfa.h"

#import <AdSupport/ASIdentifierManager.h>


@implementation NSString (ZLIdfa)

+ (NSString *)advertisingId {
    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    return advertisingId;
}


@end
