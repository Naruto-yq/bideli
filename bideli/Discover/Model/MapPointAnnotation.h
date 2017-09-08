//
//  MapPointAnnotation.h
//  bideli
//
//  Created by 杨丽娟 on 17/9/6.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//


#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import "MapPointModel.h"

@interface MapPointAnnotation : BMKPointAnnotation

@property (nonatomic,strong) MapPointModel *mapPointModel;

- (id)initWithMapPointModel:(MapPointModel *)mapPointModel;

@end
