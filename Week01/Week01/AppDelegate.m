//
//  AppDelegate.m
//  Week01
//
//  Created by 李非非 on 2018/7/6.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "AppDelegate.h"
#import <UMCommon/UMCommon.h>//导入友盟SDK类库
#import <UMAnalytics/MobClick.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /** 设置 统计场景类型，默认为普通应用统计：E_UM_NORMAL
     @param 游戏统计设置为：E_UM_GAME.Dplus统计设置为：E_UM_DPLUS
     */
    [MobClick setScenarioType:E_UM_DPLUS];
    //Crash 收集**注意：**    此函数需在common sdk初始化前适用，默认是开启状态
    [MobClick setCrashReportEnabled:YES];
    //打开加密传输
    [UMConfigure setEncryptEnabled:YES];
    
    //设置打开日志 一定要先于初始化
    [UMConfigure setLogEnabled:YES];
    
    //初始化友盟SDK类库 5b3de394a40fa30424000026
    [UMConfigure initWithAppkey:@"5b3de394a40fa30424000026" channel:nil];
    
    //获得集成测试需要的device_id
    NSString *deviceID = [UMConfigure deviceIDForIntegration];
    if ([deviceID isKindOfClass:[NSString class]]){
        //  取得字符串 device_id
        NSLog(@"服务器端成功返回deviceID");
        //NSLog(@"集成测试的deviceID:%@",deviceID);
        NSLog(@"集成测试的deviceID:%@",deviceID);
        
    }else{
        NSLog(@"服务器端还没有返回deviceID");

    }
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
