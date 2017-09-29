//
//  QJProgressHUD.h
//  bideli
//
//  Created by Yanglijuan on 2017/8/29.
//  Copyright © 2017年   reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface QJProgressHUD : NSObject

+ (void)showHUDWithMessage:(NSString*)message autoHide:(BOOL)needAutoHide;

// 没有网络弹框提示
+ (void)showNoNetworkHUD:(NSString *)str1 text:(NSString *)str2 autoHide:(BOOL)needAutoHide;

+ (void)changeHUDMessage:(NSString*)message;

+ (void)hideHUD;

+ (void)showHUDWithWaitingMessage:(NSString *)message;

+ (MBProgressHUD *)showHUDWithProgress:(float)progress Mode:(MBProgressHUDMode)mode message:(NSString *)message;

/**
 显示错误信息
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 @brief 显示成功信息
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

/**
 网络加载等待条
 
 @param statusText 文字 默认正在加载
 @param imageName 图片名 默认是白色圆圈
 @param view 需要加载哪个视图上 默认window
 */
+ (void)showLoading:(NSString *)statusText loadImageName:(NSString *)imageName inView:(UIView *)view;

/**
 隐藏loadingView
 
 @param view HUD父视图 animated 动画
 */
+ (void)hideLoadingHUD:(UIView *)view animated:(BOOL)animated;

@end

