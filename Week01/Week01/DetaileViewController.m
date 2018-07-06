//
//  DetaileViewController.m
//  Week01
//
//  Created by 李非非 on 2018/7/7.
//  Copyright © 2018年 移动学院. All rights reserved.
//  详情界面

#import "DetaileViewController.h"
#import <UMAnalytics/MobClick.h>

@interface DetaileViewController ()

@end

@implementation DetaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //计算事件 begin
    [MobClick beginEvent:@"Detail"];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //计算事件
    [MobClick endEvent:@"Detail"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
