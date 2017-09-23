//
//  DiscoverViewModel.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/6.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "DiscoverViewModel.h"
#import "MapPointModel.h"

@implementation DiscoverViewModel

/**
 商家初始化数据
 */
- (NSMutableArray *)businessDataSource {
    NSMutableArray *dataSource = [NSMutableArray array];
    MapPointModel *model = [[MapPointModel alloc] init];
    model.name = @"美宜家";
    model.lat = 114.061;
    model.lng = 22.528;
    
    MapPointModel *model1 = [[MapPointModel alloc] init];
    model1.name = @"百里汇";
    model1.lat = 114.137;
    model1.lng = 22.555;
    
    MapPointModel *model2 = [[MapPointModel alloc] init];
    model2.name = @"天虹";
    model2.lat = 113.937;
    model2.lng = 22.539;
    
    MapPointModel *model3 = [[MapPointModel alloc] init];
    model3.name = @"沃尔玛";
    model3.lat = 113.890;
    model3.lng = 22.560;
    
    
    [dataSource addObjectsFromArray:@[model,model1,model2,model3]];
    return dataSource;
}

@end
