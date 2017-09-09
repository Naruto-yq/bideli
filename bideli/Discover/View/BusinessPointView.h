//
//  BusinessPointView.h
//  bideli
//
//  Created by Yanglijuan on 2017/9/6.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//  商家头像view

#import <BaiduMapAPI_Map/BMKAnnotationView.h>
#import "MapPointModel.h"

@interface BusinessPointView : BMKAnnotationView

@property (nonatomic,strong) MapPointModel *mapPointModel;
/**
 动画效果
 */
@property (nonatomic) BOOL animatesDrop;

+ (instancetype)annotationViewWithMap:(BMKMapView *)mapView withAnnotation:(id <BMKAnnotation>)annotation;
/*
+ (instancetype)businessPointViewWithMapView:(BMKMapView *)mapView Annotation:(id<BMKAnnotation>)annotation;

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier;
*/
 @end
