//
//  PersonCenterViewController.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "PersonCenterModel.h"
#import "PersonCenterIconCell.h"
#import "PersonCenterTitleCell.h"

#define ICON_CELL_ID @"PersonCenterIconCellID"
#define TITLE_CELL_ID @"PersonCenterTitleCellID"

@interface PersonCenterViewController ()

@end

@implementation PersonCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
#pragma mark - 添加子空间
-(void)addViews{
    //添加背景图片
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:SCREEN_BOUNDS];
    backgroundImageView.image = [UIImage imageNamed:@"personcenter_background"];
    [self.view addSubview:backgroundImageView];
    [self addTableView];
    
}
-(void)addDatas{
    [super addDatas];
    PersonCenterModel *iconM = [PersonCenterModel personCenterModelWithDictionary:@{@"title":@"root_nav_left_menu",@"imageName":@"root_nav_left_menu",@"cellType":@1}];
    PersonCenterModel *personMessageM = [PersonCenterModel personCenterModelWithDictionary:@{@"title":@"个人资料",@"imageName":@"",@"cellType":@0}];
    PersonCenterModel *myCollectM = [PersonCenterModel personCenterModelWithDictionary:@{@"title":@"我的收藏",@"imageName":@"",@"cellType":@0}];
    PersonCenterModel *aboutUsM = [PersonCenterModel personCenterModelWithDictionary:@{@"title":@"关于我们",@"imageName":@"",@"cellType":@0}];
    [self.dataArray addObjectsFromArray:@[iconM,personMessageM,myCollectM,aboutUsM]];
//    _dataArray add
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PersonCenterModel *model = self.dataArray[indexPath.row];
//    if (model.cellType == 0) {
//        PersonCenterTitleCell *cell = [PersonCenterTitleCell tableViewCellWithTableView:tableView dequeueReusableCellWithIdentifier:TITLE_CELL_ID];
//        //[PersonCenterTitleCell personCenterTitleCellWithTableView:tableView dequeueReusableCellWithIdentifier:TITLE_CELL_ID];
//        return cell;
//    }else if (model.cellType == 1){
//        PersonCenterIconCell *cell = [PersonCenterIconCell tableViewCellWithTableView:tableView dequeueReusableCellWithIdentifier:ICON_CELL_ID];
//        [cell cellForModel:model];
//        return cell;
//    }
   
    
    switch (model.cellType) {
        case 0:
        {
            //  标题
            PersonCenterTitleCell *cell = [PersonCenterTitleCell personCenterTitleCellWithTableView:tableView dequeueReusableCellWithIdentifier:TITLE_CELL_ID];
            return cell;
        }
            break;
        case 1:
            //  头像
        {
            
        }
            break;

        default:
            break;
    }
    return [[UITableViewCell alloc]init];
}
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
