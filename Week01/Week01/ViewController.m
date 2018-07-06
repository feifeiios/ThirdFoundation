//
//  ViewController.m
//  Week01
//
//  Created by 李非非 on 2018/7/6.
//  Copyright © 2018年 移动学院. All rights reserved.
//  在友盟官网 ：http://mobile.umeng.com/apps/62000042403af04a493ed3b5/events/dashboard 功能使用，自定义官网上查找信息

#import "ViewController.h"
#import <UMAnalytics/MobClick.h>
#import "DetaileViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)homeClick:(id)sender {
    [MobClick event:@"home"];
}
- (IBAction)loginClick:(id)sender {
    [MobClick event:@"login" label:@"login_lable"];
}
- (IBAction)shopMailClick:(id)sender {
    [MobClick event:@"shopMail" attributes:@{@"shopMail":@"shopMail_lable"}];
}
- (IBAction)detailClick:(id)sender {
    //声明一个界面对象
    DetaileViewController *detailVc = [[DetaileViewController alloc]init];
    //跳转到该界面
    [self presentViewController:detailVc animated:YES completion:nil];
    //自己拓展 + (void)event:(NSString *)eventId attributes:(NSDictionary *)attributes counter:(int)number;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
