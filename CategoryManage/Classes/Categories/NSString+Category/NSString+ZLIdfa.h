//
//  NSString+ZLBIdfa.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/11.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZLIdfa)

/**
 *  广告标示符
 *  适用于对外：例如广告推广，换量等跨应用的用户追踪等。
 *  @return 广告标示符
 */
+ (NSString *)advertisingId;


@end

NS_ASSUME_NONNULL_END
