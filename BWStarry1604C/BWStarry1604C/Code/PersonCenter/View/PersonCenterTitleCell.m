//
//  PersonCenterTitleCell.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "PersonCenterTitleCell.h"

@implementation PersonCenterTitleCell


+(instancetype)personCenterTitleCellWithTableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier{
    PersonCenterTitleCell *cell = [PersonCenterTitleCell tableViewCellWithTableView:tableView dequeueReusableCellWithIdentifier:identifier];
    //[tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[PersonCenterTitleCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
//    }
    return cell;
}
-(void)addViews{
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, 40.0, 100.0)];
    [self addSubview:titleLable];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
