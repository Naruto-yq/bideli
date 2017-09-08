//
//  JJSBaiduLocationManager.h
//  JJSButler
//
//  Created by 邱荷凌 on 15/7/6.
//  Copyright (c) 2015年 邱荷凌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>

/**
 *  Description:百度地图定位
 */
@interface JJSBaiduLocationManager : NSObject<BMKLocationServiceDelegate,UIAlertViewDelegate>

@property (nonatomic, assign) CGFloat currentLng;
@property (nonatomic, assign) CGFloat currentLat;

@property (nonatomic, strong) BMKUserLocation * userLocation;
/**
 *  Description:定位是否成功
 */
@property (nonatomic ,assign) BOOL isLocationSuccess;

@property (nonatomic ,copy) void (^SuccessAction)(void);

+ (JJSBaiduLocationManager *)sharedInstance;

@end
