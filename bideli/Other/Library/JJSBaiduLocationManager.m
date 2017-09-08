//
//  JJSBaiduLocationManager.m
//  JJSButler
//
//  Created by 邱荷凌 on 15/7/6.
//  Copyright (c) 2015年 邱荷凌. All rights reserved.
//

#import "JJSBaiduLocationManager.h"

@implementation JJSBaiduLocationManager

{
    BMKLocationService *_locService;
}

static JJSBaiduLocationManager *_sharedInstance = nil;

+ (JJSBaiduLocationManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        //判断定位操作是否被允许
        _locService = [[BMKLocationService alloc] init];
        _locService.delegate = self;
        [_locService startUserLocationService];
    }
    return self;
}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
//    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
//    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    //当次经纬度
    self.currentLat = userLocation.location.coordinate.latitude;
    self.currentLng = userLocation.location.coordinate.longitude;
    
    self.userLocation = userLocation;
    
    if (!self.isLocationSuccess) {
        self.isLocationSuccess = YES;
        [_locService stopUserLocationService];
    }
    if (self.SuccessAction) {
        self.SuccessAction();
    }
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
//    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    switch([error code]) {
        case kCLErrorDenied:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务未打开" message:@"请打开定位服务。到手机的“设置>隐私>定位服务”，允许必得利访问。" delegate:self cancelButtonTitle:@"设置" otherButtonTitles:@"取消", nil];
            [alert show];
        }
            break;
        case kCLErrorNetwork: // general, network-related error
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"定位服务失败" message:@"请检查您的网络是否正常。" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
        }
        case kCLErrorLocationUnknown:
            
            break;
        default:
            
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.cancelButtonIndex) {
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        } else {
            // 跳转到设置界面，打开定位
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"]];
        }
    }
}

- (void)dealloc {
    _locService.delegate = nil;
    [_locService stopUserLocationService];
}

@end
