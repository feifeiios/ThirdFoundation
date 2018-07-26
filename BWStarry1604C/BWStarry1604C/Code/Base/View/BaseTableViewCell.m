//
//  BaseTableViewCell.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addViews];
    }
    return self;
}
+(instancetype)tableViewCellWithTableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    return cell;
}
#pragma mark - 添加子控件
-(void)addViews{
    
}
#pragma mark - 赋值
-(void)cellForModel:(BaseModel *)model{
    
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
