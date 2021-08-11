//
//  UIFont+ZLEditLine.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2020/2/16.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//


#import <UIKit/UIKit.h>



@interface UIFont (ZLEditLine)

@property (nonatomic, readonly) BOOL bold;
@property (nonatomic, readonly) BOOL italic;
@property (nonatomic, readonly) float fontSize;


+ (instancetype)fontWithCustomFont:(UIFont *)font bold:(BOOL)bold italic:(BOOL)italic;


@end


