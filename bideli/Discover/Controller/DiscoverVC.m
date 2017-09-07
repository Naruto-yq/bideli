//
//  DiscoverVC.m
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "DiscoverVC.h"
#import <BaiduMapAPI_Map/BMKMapView.h>

@interface DiscoverVC ()<BMKMapViewDelegate>
@property (nonatomic,strong) BMKMapView *mapView;//地图视图
@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"发现";
    
    //初始化地图
    self.mapView = [[BMKMapView alloc] initWithFrame:self.view.frame];
    self.mapView.delegate =self;
    //设置地图的显示样式
    self.mapView.mapType = BMKMapTypeStandard;
    
//    //设定地图是否打开路况图层
//    self.mapView.trafficEnabled = YES;
//    
//    //底图poi标注
//    self.mapView.showMapPoi = NO;
//    
//    //在手机上当前可使用的级别为3-21级
//    self.mapView.zoomLevel = 21;
//    
//    //设定地图View能否支持旋转
//    self.mapView.rotateEnabled = YES;
//    
//    //设定地图View能否支持用户移动地图
//    self.mapView.scrollEnabled = YES;
//    
    //添加到view上
    [self.view addSubview:self.mapView];
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
