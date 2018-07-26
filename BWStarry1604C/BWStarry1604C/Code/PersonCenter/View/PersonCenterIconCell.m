//
//  PersonCenterIconCell.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "PersonCenterIconCell.h"
#import "PersonCenterModel.h"

@interface PersonCenterIconCell()
//{
//    UIImageView *_icon;
//}
@property (nonatomic , strong ) UIImageView *icon;//   头像
@end
@implementation PersonCenterIconCell
//-(void)addViews{
//    [super addViews];
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 80.0)];
//    _icon = image;
//    [self addSubview:_icon];
//
//}
- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 80.0, 80.0)];
        [self addSubview:_icon];
    }
    return _icon;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _icon.center = self.center;
}
- (void)cellForModel:(BaseModel *)model{
    PersonCenterModel *p = (PersonCenterModel *) model;
    _icon.image = [UIImage imageNamed:p.imageName];
    
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
