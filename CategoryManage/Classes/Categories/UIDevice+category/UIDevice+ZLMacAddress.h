//
//  UIDevice+ZLMacAddress.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/12/5.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (ZLMacAddress)

/**
 *  获取mac地址
 *
 *  iOS7以后苹果对于sysctl和ioctl进行了技术处理，MAC地址返回的都是02:00:00:00:00:00
 *
 *  @param delimiter 分隔符
 *
 *  @return mac地址
 */
+ (NSString *)macAddress:(NSString *)delimiter;

/**
 *  获取ip地址
 *
 *  @param preferIPv4 是否获取ipv4的地址  否的话是ipv6
 *
 *  @return ip地址
 */
+ (NSString *)ipAddress:(BOOL)preferIPv4;


/// 操作系统 【1：安卓, 2：苹果手机, 3：用户pc端, 4：后台推送】
+ (NSInteger )platform;

/// 联网方式 【2:WIFI, 1:蜂窝网络】
+ (NSInteger )netway;

/// 是否是 蜂窝网络
+ (BOOL)isMobileNetwork;

+ (NSInteger)getDetalNetWay;

/// 联网方式 【1:2G 2:3G 3:4G 5】

/// 运营商 
+ (NSString *)operatorName;


/**
*  网络运营商(network_operator) 可选
*  1：中国移动 2：中国联通 3：中国电信 4：中国网通 5：中国铁通 6：中国卫通 99：其他
*/
///获取运营商
+ (NSString *)getCTCarrierName;

///获取运营商编码
+ (NSString *)getCTMobileNetworkCode;

///获取App的Version版本
+ (NSString *)appShortVersion;

@end

NS_ASSUME_NONNULL_END
