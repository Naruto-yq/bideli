//
//  LocationPermissionsViewController.m
//  JJSHome
//
//  Created by Zhouyongbo on 2017/7/1.
//  Copyright © 2017年 JJSHome. All rights reserved.
//

#import "LocationPermissionsViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "QJMainTabBarController.h"
#import "QJNavigationController.h"
#import "LoginVC.h"

@interface LocationPermissionsViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationPermissionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 68) / 2.0f, 68, 68, 50)];
    [locationImageView setImage:[UIImage imageNamed:@"guide_new_location"]];
    [self.view addSubview:locationImageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(locationImageView.frame) + 20, SCREEN_WIDTH, 30)];
    titleLabel.text = @"获取位置信息";
    titleLabel.textColor = KC1_515151;
    titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame) + 20, SCREEN_WIDTH, 20)];
    subTitleLabel.text = @"为您精准推荐附近商圈";
    subTitleLabel.textColor = KC1_515151;
    subTitleLabel.font = [UIFont systemFontOfSize:13.0f];
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:subTitleLabel];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self findMe]; // 开启定位
}

- (void)findMe {
    /** 由于IOS8中定位的授权机制改变 需要进行手动授权
     * 获取授权认证，两个方法：
     * [self.locationManager requestWhenInUseAuthorization];
     * [self.locationManager requestAlwaysAuthorization];
     */
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        NSLog(@"requestAlwaysAuthorization");
        [self.locationManager requestAlwaysAuthorization];
    }
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        NSLog(@"requestWhenInUseAuthorization");
        [self.locationManager requestWhenInUseAuthorization];
    }
    //开始定位，不断调用其代理方法
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    [self changeRootViewController];
    // 1.获取用户位置的对象
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"纬度:%f 经度:%f", coordinate.latitude, coordinate.longitude);
    // 2.停止定位
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    [self changeRootViewController];
    if (error.code == kCLErrorDenied) { // 用户拒绝
        // 提示用户出错原因，可按住Option键点击 KCLErrorDenied的查看更多出错信息，可打印error.code值查找原因所在
    }
}

/**
 切换跟控制器
 */
- (void)changeRootViewController {
    // 将UITabBarController设置为跟控制器
    if ([[GLobalLocalData getLoginState] boolValue]) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[QJMainTabBarController alloc] init];
    }else {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[QJNavigationController alloc] initWithRootViewController:[[LoginVC alloc] init]];
    }
}

@end
