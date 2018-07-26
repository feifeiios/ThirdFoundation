//
//  BaseTableViewCell.h
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell
#pragma mark - 类方法 构造对象
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier;
#pragma mark - 添加子控件
-(void)addViews;
#pragma mark - 赋值
-(void)cellForModel:(BaseModel *)model;

@end
