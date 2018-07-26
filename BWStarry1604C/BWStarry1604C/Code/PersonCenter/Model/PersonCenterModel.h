//
//  PersonCenterModel.h
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonCenterModel : BaseModel

@property (nonatomic , assign ) NSInteger cellType;//cell类型 = 0 标题 | = 1 图片
@property (nonatomic , copy ) NSString *title;//标题
@property (nonatomic , copy ) NSString *imageName;//图片名字

#pragma mark - 传入字典即可
+ (instancetype)personCenterModelWithDictionary:(NSDictionary *)dict ;
@end
