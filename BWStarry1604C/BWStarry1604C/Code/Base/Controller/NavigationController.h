//
//  NavigationController.h
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UINavigationController

/*
 构造对象方法
 */
+(instancetype)navigationControllerWithViewController:(UIViewController *)vc andTitle:(NSString *)title andImage:(NSString *)image andSelectedImage:(NSString *)selectedImage ;

@end
