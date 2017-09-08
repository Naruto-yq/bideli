//
//  DiscoverVC.m
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "DiscoverVC.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import <BaiduMapAPI_Search/BMKPoiSearch.h>
#import "MapPointModel.h"
#import "BusinessPointView.h"
#import "MapPointAnnotation.h"
#import "DiscoverViewModel.h"
#import "JJSBaiduLocationManager.h"

@interface DiscoverVC ()<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKPoiSearchDelegate>

@property (nonatomic,strong) BMKMapView *mapView;//地图视图
@property (nonatomic,strong) NSMutableArray *businessDataSource;//商家数据
@property (nonatomic,assign) CLLocationCoordinate2D coordinate2D;// 百度地图中心点经纬度
@property (nonatomic,strong) BMKLocationService *locationService;// 百度定位服务
@property (nonatomic,strong) BMKPoiSearch *poiSearch;

@end

@implementation DiscoverVC

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeBaseView];
    [self initializeBaseData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
    self.mapView.delegate = self;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
}

#pragma mark -- mapView delegate
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    BusinessPointView *pointView = [BusinessPointView businessPointViewWithMapView:mapView Annotation:annotation];
    MapPointAnnotation *mapAnnotation = (MapPointAnnotation *)annotation;
    pointView.frame = CGRectMake(0, 0, 96, 130);
    pointView.mapPointModel = mapAnnotation.mapPointModel;
    pointView.canShowCallout = NO;
    pointView.enabled = YES;
    
    return pointView;
    
}

#pragma mark --百度地图代理
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    NSLog(@"百度定位当前位置%f,%f", userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    self.coordinate2D = userLocation.location.coordinate;
    [self.mapView updateLocationData:userLocation];
    // 关闭定位
    [self.locationService stopUserLocationService];
}

/**
 百度地图定位失败触发
 */
- (void)didFailToLocateUserWithError:(NSError *)error {
    NSLog(@"%@",error);
}

#pragma mark - event response

#pragma mark - private methods
- (void)initializeBaseView {
    self.navigationItem.title = @"发现";
    //添加到view上
    [self.view addSubview:self.mapView];
    
}

- (void)initializeBaseData {
    [self checkAllowLocationService];
    
    [self.locationService startUserLocationService];

    //    DiscoverViewModel *VM = [[DiscoverViewModel alloc] init];
    //    [self.businessDataSource addObjectsFromArray:[VM businessDataSource]];
    //    if (self.businessDataSource.count > 0) {
    //        [self addAnnotationViewToMapView];
    //    }
    
}

/**
 检查是定位权限是否打开
 */
- (void)checkAllowLocationService {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"打开“定位服务”来允许“必得利”确定您的位置" delegate:self cancelButtonTitle:@"设置" otherButtonTitles:@"取消", nil];
        [alertView show];
    }else{
        [self.locationService startUserLocationService];
        self.mapView.showsUserLocation = YES;//先关闭显示的定位图层
        self.mapView.userTrackingMode = BMKUserTrackingModeFollow;//设置定位的状态
        self.mapView.showsUserLocation = YES;//显示定位图层
        
    }
}

/**
 向地图中添加标注
 */
- (void)addAnnotationViewToMapView {
    // 移除之前的标注,除地铁外
    for (id obj in self.mapView.annotations) {
        [self.mapView removeAnnotation:obj];
    }
    // 添加标注
//        for (MapPointModel *model in self.businessDataSource) {
//            MapPointAnnotation *annotation = [[MapPointAnnotation alloc] initWithMapPointModel:model];
//            CLLocationCoordinate2D coor;
//            coor.latitude = model.lat;
//            coor.longitude = model.lng;
//            annotation.coordinate = coor;
//            annotation.title = model.name;
//            annotation.mapPointModel = model;
//            [self.mapView addAnnotation:annotation];
//        }
//    [self.mapView setCenterCoordinate:self.coordinate2D animated:YES];
}

#pragma mark --lazy init
- (BMKMapView *)mapView {
    if (!_mapView) {
        _mapView = [[BMKMapView alloc] initWithFrame:self.view.frame];
        _mapView.delegate =self;
        //设置地图的显示样式
        _mapView.mapType = BMKMapTypeStandard;
        //在手机上当前可使用的级别为3-21级
        self.mapView.zoomLevel = 18;
        //设定地图是否打开路况图层
        self.mapView.trafficEnabled = YES;
        //底图poi标注
        self.mapView.showMapPoi = YES;
        //设定地图View能否支持旋转
        self.mapView.rotateEnabled = YES;
        //设定地图View能否支持用户移动地图
        self.mapView.scrollEnabled = YES;
    }
    return _mapView;
}

- (NSMutableArray *)businessDataSource {
    if (!_businessDataSource) {
        _businessDataSource = [NSMutableArray array];
    }
    return _businessDataSource;
}

- (BMKLocationService *)locationService {
    if (!_locationService) {
        //初始化BMKLocationService
        _locationService = [[BMKLocationService alloc]init];
        _locationService.delegate = self;
    }
    return _locationService;
}

@end
