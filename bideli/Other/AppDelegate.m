//
//  AppDelegate.m
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 xxx. All rights reserved.
//

#import "AppDelegate.h"
#import <BaiduMapAPI_Base/BMKMapManager.h>
#import "QJMainTabBarController.h"
#import "LocationPermissionsViewController.h"
#import "LanuchAVPlayerVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[LanuchAVPlayerVC alloc] init];

    [self registerBaiduMap];
    
    return YES;
}

//- (void)startLocation {
//    // 判断该用户是否已经对房产网定位进行过授权
//    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) { // 暂未授权
//        // 展示位置授权页
//        LocationPermissionsViewController *locationPermissionsVC = [[LocationPermissionsViewController alloc] init];
//        [self restoreRootViewController:locationPermissionsVC];
//    } else {
//        // 将UITabBarController设置为跟控制器
//        [UIApplication sharedApplication].keyWindow.rootViewController = [[QJMainTabBarController alloc] init];
//    }
//}

//// 登陆后淡入淡出更换rootViewController
//- (void)restoreRootViewController:(UIViewController *)rootViewController {
//    typedef void (^Animation)(void);
//    UIWindow* window = [UIApplication sharedApplication].keyWindow;
//    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    Animation animation = ^{
//        BOOL oldState = [UIView areAnimationsEnabled];
//        [UIView setAnimationsEnabled:NO];
//        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
//        [UIView setAnimationsEnabled:oldState];
//    };
//    [UIView transitionWithView:window
//                      duration:0.5f
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:animation
//                    completion:nil];
//}


#pragma mark - Third library
- (void)registerBaiduMap{
    //创建并初始化一个引擎对象
    BMKMapManager *manager = [[BMKMapManager alloc] init];
    //启动地图引擎
    BOOL success =  [manager start:APPKEY_BaiDuMap generalDelegate:nil];
    if (!success) {
        NSLog(@"失败");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
