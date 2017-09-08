//
//  MapPointAnnotation.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/6.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "MapPointAnnotation.h"

@implementation MapPointAnnotation

- (id)initWithMapPointModel:(MapPointModel *)mapPointModel {
    self = [super init];
    if(self){
        _mapPointModel = mapPointModel;
    }
    return self;
}

@end
