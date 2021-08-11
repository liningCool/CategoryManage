//
//  UIDevice+ZLMacAddress.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/12/5.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UIDevice+ZLMacAddress.h"

#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <netinet/in.h>
#include <ifaddrs.h>
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
//#import "CoreStatus.h"

#define IOS_AWDL        @"awdl0"
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_LOC            @"lo0"
#define IOS_VPN            @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"


@implementation UIDevice (ZLMacAddress)


+ (NSString *)macAddress:(NSString *)delimiter
{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;

    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;

    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }

    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }

    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }

    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }

    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X%@%02X%@%02X%@%02X%@%02X%@%02X",
        *ptr, delimiter, *(ptr + 1), delimiter, *(ptr + 2), delimiter, *(ptr + 3), delimiter, *(ptr + 4), delimiter, *(ptr + 5)];
    free(buf);

    return macString;
}

//获取当前连接Wi-Fi的IP地址
+ (NSString *)ipAddress:(BOOL)preferIPv4
{
    NSArray *searchArray = preferIPv4 ?
        @[IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_AWDL @"/" IP_ADDR_IPv4, IOS_AWDL @"/" IP_ADDR_IPv6, IOS_LOC @"/" IP_ADDR_IPv4, IOS_LOC @"/" IP_ADDR_IPv6] :
    @[IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_AWDL @"/" IP_ADDR_IPv6, IOS_AWDL @"/" IP_ADDR_IPv4, IOS_LOC @"/" IP_ADDR_IPv6, IOS_LOC @"/" IP_ADDR_IPv4];

    NSDictionary *addresses = [self getIPAddresses];

    NSLog(@"addresses: %@", addresses);

    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop)
    {
        address = addresses[key];

        if (address) {
            *stop = YES;
        }
    }];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)getIPAddresses
{
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];

    // retrieve the current interfaces - returns 0 on success
    struct ifaddrs *interfaces;

    if (!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;

        for (interface = interfaces; interface; interface = interface->ifa_next) {
            if (!(interface->ifa_flags & IFF_UP) /* || (interface->ifa_flags & IFF_LOOPBACK) */) {
                continue; // deeply nested code harder to read
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in *)interface->ifa_addr;
            char addrBuf[MAX(INET_ADDRSTRLEN, INET6_ADDRSTRLEN)];

            if (addr && (addr->sin_family == AF_INET || addr->sin_family == AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                NSString *type;

                if (addr->sin_family == AF_INET) {
                    if (inet_ntop(AF_INET, &addr->sin_addr, addrBuf, INET_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv4;
                    }
                }
                else {
                    const struct sockaddr_in6 *addr6 = (const struct sockaddr_in6 *)interface->ifa_addr;

                    if (inet_ntop(AF_INET6, &addr6->sin6_addr, addrBuf, INET6_ADDRSTRLEN)) {
                        type = IP_ADDR_IPv6;
                    }
                }

                if (type) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, type];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }

        // Free memory
        freeifaddrs(interfaces);
    }
    return [addresses count] ? addresses : nil;
}

+ (NSInteger )platform {
    return 2;
}

+ (NSInteger )netway {
 
    return 1;
}

+ (NSInteger)getDetalNetWay {
 
    return 5;
}

+ (BOOL)isMobileNetwork {
 
    return YES;
}


+ (NSString *)operatorName {
    
    return [UIDevice getCTCarrierName];
}

+ (NSString *)getCTCarrierName
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [info subscriberCellularProvider];
 
    if ([carrier.carrierName length] == 0) {
        return @"";
    }
    return  carrier.carrierName;
}

+ (NSString *)getCTMobileNetworkCode
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc]init];
    CTCarrier *carrier = [info subscriberCellularProvider];

    return carrier.mobileNetworkCode;
}

+ (NSString *)appShortVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
    NSString *value = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

    if ((nil == value) || (0 == value.length)) {
        value = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    }

    return value;

#else // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return nil;
#endif // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

@end
