//
//  MyDownloadTableViewCell.h
//  JiaXue
//
//  Created by xiang_jj on 15/11/27.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaiBoModel.h"
#import "MySessionDownloadStopAndResume.h"

@interface MyDownloadTableViewCell : UITableViewCell

@property(nonatomic,strong)WaiBoModel *waiboModel;

@property(nonatomic,strong)MySessionDownloadStopAndResume *session;
@property(nonatomic,strong)id objc;

-(void)updateUI;

@end
