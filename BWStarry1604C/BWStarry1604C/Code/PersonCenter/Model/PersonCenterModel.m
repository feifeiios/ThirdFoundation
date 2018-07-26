//
//  PersonCenterModel.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "PersonCenterModel.h"
@interface PersonCenterModel()


@end
@implementation PersonCenterModel

-(instancetype)initPersonCenterModelWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)personCenterModelWithDictionary:(NSDictionary *)dict{
    PersonCenterModel *p ;
    if (p == nil) {
        p = [[PersonCenterModel alloc]initPersonCenterModelWithDictionary:dict];
    }
    return p;
}
@end
