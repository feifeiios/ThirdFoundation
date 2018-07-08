//
//  RootViewController.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "RootViewController.h"
#import "PersonCenterViewController.h"
#import "NewsViewController.h"
#import "ShopMallViewController.h"
#import "LiveBroadcaseViewController.h"

#import "LoginViewController.h"
#import "TabBarController.h"
#import "NavigationController.h"


@interface RootViewController ()
@property (nonatomic , strong ) PersonCenterViewController *personCenterVc;//   个人中心
@property (nonatomic , strong ) TabBarController *tabbarVc;//tabbar控制器
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    _personCenterVc = [[PersonCenterViewController alloc]init];
    [self addChildViewController:_personCenterVc];
    
    _tabbarVc = [[TabBarController alloc]init];
    //添加tabbarVc的子控制器
    [self addTabbarVcChildrens];
    [self addChildViewController:
     _tabbarVc];

    //添加视图
    [self.view addSubview:_personCenterVc.view];
    [self.view addSubview:_tabbarVc.view];
    
    // Do any additional setup after loading the view.
}
#pragma - mark 添加tabbarVc的子控制器
-(void)addTabbarVcChildrens{
    //初始化新闻页面
    NewsViewController *newsVc = [[NewsViewController alloc]init];
    //导航控制器包裹 新闻页面
    NavigationController *navNews = [NavigationController navigationControllerWithViewController:newsVc andTitle:@"新闻" andImage:@"tabbar_news" andSelectedImage:@"tabbar_news_selected"];
    //[[NavigationController alloc]initWithRootViewController:newsVc];
//    [navNews.tabBarItem setTitle:@""];
//    [navNews.tabBarItem setImage:[UIImage imageNamed:@""]];
//    [navNews.tabBarItem setSelectedImage:[UIImage imageNamed:@""]];
    
    //初始化商城页面
    NewsViewController *shopMallVc = [[NewsViewController alloc]init];
    //导航控制器包裹 商城页面
    NavigationController *navShopMallVc = [NavigationController navigationControllerWithViewController:shopMallVc andTitle:@"商城" andImage:@"tabbar_shopmall" andSelectedImage:@"tabbar_shopmall_selected"];
    //[[NavigationController alloc]initWithRootViewController:shopMallVc];
    
    //初始化直播页面
    NewsViewController *liveBroadcastVc = [[NewsViewController alloc]init];
    //导航控制器包裹 直播页面
    NavigationController *navLiveBroadcastVc = [NavigationController navigationControllerWithViewController:liveBroadcastVc andTitle:@"直播" andImage:@"tabbar_livecast" andSelectedImage:@"tabbar_livecast_selected"];// [[NavigationController alloc]initWithRootViewController:liveBroadcastVc];
    
    //添加左侧按钮点击
    [newsVc addLeftMenuWithTabBarController:_tabbarVc andPersonCenterViewController:_personCenterVc];
    [shopMallVc addLeftMenuWithTabBarController:_tabbarVc andPersonCenterViewController:_personCenterVc];
    [liveBroadcastVc addLeftMenuWithTabBarController:_tabbarVc andPersonCenterViewController:_personCenterVc];
    //addLeftMeunWithTabBarController
    //添加到tabbarVc
    _tabbarVc.viewControllers = @[navNews,navShopMallVc,navLiveBroadcastVc];
    
}
////封装
///*
// NavigationController *navNews = [[NavigationController alloc]initWithRootViewController:newsVc];
// [navNews.tabBarItem setTitle:@""];
// [navNews.tabBarItem setImage:[UIImage imageNamed:@""]];
// [navNews.tabBarItem setSelectedImage:[UIImage imageNamed:@""]];
// */
//-(NavigationController *)navigationControllerWithViewController:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage {
//    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:vc];
//    [nav.tabBarItem setTitle:title];
//    [nav.tabBarItem setImage:[UIImage imageNamed:image]];
//    [nav.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
//    return nav;
//}
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
