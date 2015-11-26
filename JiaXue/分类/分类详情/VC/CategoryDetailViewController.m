//
//  CategoryDetailViewController.m
//  JiaXue
//
//  Created by xiang_jj on 15/11/25.
//  Copyright (c) 2015年 xiang_jj  千锋. All rights reserved.
//

#import "CategoryDetailViewController.h"
#import "XJViewController.h"
#import "CategoryDetailTableViewController.h"
#import "CategoryListModel.h"
@interface CategoryDetailViewController ()

@end

@implementation CategoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    XJViewController *xjj = [[XJViewController alloc] init];
    NSMutableArray *mArr = [NSMutableArray array];
    NSMutableArray *vcs  = [NSMutableArray array];
    for (int i = 0;i<self.model.subcategories.count;i++) {
        
        CategoryListModel *listModel = self.model.subcategories[i];
        CategoryDetailTableViewController *cvc = [[CategoryDetailTableViewController alloc] init];
        cvc.listModel = listModel;
        [vcs addObject:cvc];
        [mArr addObject:listModel.name];
    }
    xjj.btnArray =  [mArr copy];
    xjj.myViewControllers = [vcs copy];
    xjj.number = 4;
    xjj.view.frame = self.view.bounds;
    [self.view addSubview:xjj.view];
    [self addChildViewController:xjj];
    
    [xjj  upDateUIButtonAndLabel:self.index];
    [xjj  updateScrollViewWithPage:self.index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
