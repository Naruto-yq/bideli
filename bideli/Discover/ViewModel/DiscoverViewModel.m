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
    model.name = @"商家";
    model.lat = 113.69;
    model.lng = 22.35;
    
    MapPointModel *model1 = [[MapPointModel alloc] init];
    model1.name = @"商家";
    model1.lat = 113.69;
    model1.lng = 23;
    
    MapPointModel *model2 = [[MapPointModel alloc] init];
    model2.name = @"商家";
    model2.lat = 114.69;
    model2.lng = 22.55;
    
    MapPointModel *model3 = [[MapPointModel alloc] init];
    model3.name = @"商家";
    model3.lat = 114;
    model3.lng = 22.7;
    
    
    [dataSource addObjectsFromArray:@[model,model1,model2,model3]];
    return dataSource;
}

@end
