//
//  BaseViewController.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//  UIViewController 的基础类

#import "BaseViewController.h"
#import "TabBarController.h"
#import "PersonCenterViewController.h"

@interface BaseViewController ()

{
    TabBarController *_tabbarVc;
    PersonCenterViewController *_personCenterVc;//个人中心
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色为灰色
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view.
    [self addViews];
    [self addDatas];
}
#pragma mark - 添加TableView
-(UITableView *)addTableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:SCREEN_BOUNDS style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self ;
        [self.view addSubview:_tableView];
        
    }
    
    return _tableView;
}
#pragma mark - 添加数据
-(void)addDatas{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
}
#pragma mark - UITableViewDataSource , UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray == nil ? 0 : _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - 添加子空间
-(void)addViews{
    
}
#pragma - mark 左侧点击按钮
-(void)addLeftMenuWithTabBarController:(TabBarController *) tabbarVc andPersonCenterViewController:(PersonCenterViewController *)personCenterVc{
    //赋值
    _tabbarVc = tabbarVc;
    _personCenterVc = personCenterVc;
    //添加左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"root_nav_left_menu"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftMenuClick:)];
}
#pragma mark - 左侧点击
-(void)leftMenuClick:(UIBarButtonItem *)item {
    if (_tabbarVc != nil) {
        if (_tabbarVc.view.frame.origin.x > 0) {
            //动画
            [UIView animateWithDuration:0.25 animations:^{
                //目前tabbarVc 已经右移位置，复原
                self->_tabbarVc.view.frame = CGRectMake(0.0, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self->_personCenterVc.view.transform = CGAffineTransformMakeScale(1.5, 1.5);//CGAffineTransformIdentity还原
            }];
            
        }else{
            //添加动画
            [UIView animateWithDuration:0.25 animations:^{
                //目前tabbarVc在原位，需要向右偏移
                self->_tabbarVc.view.frame = CGRectMake(SCREEN_OFF_X, 0.0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self->_personCenterVc.view.transform = CGAffineTransformIdentity;//还原
                
            }];
            

        }
    }
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
