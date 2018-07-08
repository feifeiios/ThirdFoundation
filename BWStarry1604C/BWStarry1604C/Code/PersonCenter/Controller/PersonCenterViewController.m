//
//  PersonCenterViewController.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "PersonCenterViewController.h"

@interface PersonCenterViewController ()

@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
#pragma mark - 添加子空间
-(void)addViews{
    //添加背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    backgroundImageView.image = [UIImage imageNamed:@"personcenter_background"];
    [self.view addSubview:backgroundImageView];
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