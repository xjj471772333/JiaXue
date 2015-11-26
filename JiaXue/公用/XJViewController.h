//
//  XJViewController.h
//  JiaXue
//
//  Created by xiang_jj on 15/11/25.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface XJViewController : UIViewController

@property(nonatomic,strong)NSArray *btnArray;//所有要显示的按钮

@property(nonatomic,strong)NSArray *myViewControllers;//所有要显示的视图

@property(nonatomic,assign)NSInteger number;//页面显示几个UIButton

//更新按钮和label的显示状态
-(void)upDateUIButtonAndLabel:(NSInteger)tag;
//更新滚动视图的偏移量
-(void)updateScrollViewWithPage:(NSInteger)page;

@end
