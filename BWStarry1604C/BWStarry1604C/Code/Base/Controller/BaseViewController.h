//
//  BaseViewController.h
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TabBarController,PersonCenterViewController;
@interface BaseViewController : UIViewController<UITableViewDataSource , UITableViewDelegate >
#pragma - mark 左侧点击按钮
-(void)addLeftMenuWithTabBarController:(TabBarController *) tabbarVc andPersonCenterViewController:(PersonCenterViewController *)personCenterVc;
#pragma mark - 添加子空间
-(void)addViews;
#pragma mark - UITableView 属性
@property (nonatomic , strong ) UITableView *tableView;
#pragma mark - NSMutableArray 数组
@property (nonatomic , strong ) NSMutableArray *dataArray;
#pragma mark - 添加TableView
-(UITableView *)addTableView;
#pragma mark - 添加数据
-(void)addDatas;


@end
