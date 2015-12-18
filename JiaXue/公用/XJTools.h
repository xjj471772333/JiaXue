//
//  XJTools.h
//  JiaXue
//
//  Created by Leven on 15/12/18.
//  Copyright © 2015年 xiang_jj  千锋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//typedef NS_ENUM(NSInteger,);


@interface XJTools : NSObject

+ (XJTools *)shareManager;

@property (nonatomic,assign)AFNetworkReachabilityStatus netStatus;

- (void)startMonitorNetStatusReachability;


@end
