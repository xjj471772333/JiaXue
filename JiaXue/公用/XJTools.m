//
//  XJTools.m
//  JiaXue
//
//  Created by Leven on 15/12/18.
//  Copyright © 2015年 xiang_jj  千锋. All rights reserved.
//

#import "XJTools.h"

@implementation XJTools

+ (XJTools *)shareManager{

    static XJTools *tools=nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        tools=[[XJTools alloc]init];
        [tools startMonitorNetStatusReachability];
    });
    
    return tools;
    
}


- (void)startMonitorNetStatusReachability{

    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 提示：要监控网络连接状态，必须要先调用单例的startMonitoring方法
    [manager startMonitoring];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        self.netStatus=status;
        [[NSNotificationCenter defaultCenter] postNotificationName:NET_STATUS_NOTIFICATION object:nil];
        
    }];
    
}

@end
