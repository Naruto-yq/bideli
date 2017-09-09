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
    model.name = @"美宜家便利店";
    model.lat = 114.086;
    model.lng = 22.603;
    
    MapPointModel *model1 = [[MapPointModel alloc] init];
    model1.name = @"百里汇";
    model1.lat = 114.089;
    model1.lng = 22.605;
    
    MapPointModel *model2 = [[MapPointModel alloc] init];
    model2.name = @"天虹";
    model2.lat = 114.088;
    model2.lng = 22.607;
    
    MapPointModel *model3 = [[MapPointModel alloc] init];
    model3.name = @"沃尔玛";
    model3.lat = 114.087;
    model3.lng = 22.609;
    
    
    [dataSource addObjectsFromArray:@[model,model1,model2,model3]];
    return dataSource;
}

@end
