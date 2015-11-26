//
//  MusicModel.h
//  3-AFNetworking_downloadFile
//
//  Created by 孙密 on 15/10/15.
//  Copyright (c) 2015年 孙密. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject

@property (nonatomic,copy)NSString *name;

+ (NSArray *)arrayWithData:(id)data;
@end
