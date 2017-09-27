//
//  QJProgressHUD.m
//  bideli
//
//  Created by Yanglijuan on 2017/8/29.
//  Copyright © 2017年   reserved.
//

#import "QJProgressHUD.h"

@implementation QJProgressHUD

+ (void)showHUDWithMessage:(NSString*)message autoHide:(BOOL)needAutoHide {
    [self hideHUD];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = message;
    hud.layer.zPosition = 9999;
    hud.removeFromSuperViewOnHide = YES;
    if (needAutoHide) {
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

+ (void)showNoNetworkHUD:(NSString *)str1 text:(NSString *)str2 autoHide:(BOOL)needAutoHide {
    [self hideHUD];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = str1;
    hud.detailsLabel.text = str2;
    hud.label.font = [UIFont systemFontOfSize:14];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.layer.zPosition = 9999;
    hud.removeFromSuperViewOnHide = YES;
    if (needAutoHide) {
        [hud hideAnimated:YES afterDelay:1.5];
    }
}

+ (void)changeHUDMessage:(NSString*)message {
    [self hideHUD];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = message;
    hud.layer.zPosition = 9999;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:1.5];
}

+ (void)hideHUD {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [MBProgressHUD hideHUDForView:window animated:YES];
}

+ (void)showHUDWithWaitingMessage:(NSString *)message {
    [self hideHUD];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (![self isBlankString:message]) {
        hud.detailsLabel.text = message;
    }
    hud.layer.zPosition = 9999;
    hud.removeFromSuperViewOnHide = YES;
}

+ (MBProgressHUD *)showHUDWithProgress:(float)progress Mode:(MBProgressHUDMode)mode message:(NSString *)message {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    if (mode == MBProgressHUDModeDeterminate || mode == MBProgressHUDModeDeterminateHorizontalBar) {
        hud.mode = mode;
    } else {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (![self isBlankString:message]) {
        hud.detailsLabel.text = message;
    }
    hud.progress = progress;
    hud.layer.zPosition = 9999;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

/**
 @author     周永波, 16-07-29 15:07:56
 
 @brief 显示信息
 
 @param text	文字
 @param icon	图片
 @param view
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.detailsLabel.text = text;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:1.5];
}

/**
 @author     周永波, 16-07-29 15:07:30
 
 @brief 显示错误信息
 
 @param error	错误文字
 @param view
 */
+ (void)showError:(NSString *)error toView:(UIView *)view {
    [self show:error icon:@"login_pop_no" view:view];
}

/**
 @author     周永波, 16-07-29 15:07:28
 
 @brief 显示成功信息
 
 @param success	成功文字
 @param view
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    [self show:success icon:@"login_pop_yes" view:view];
}

/**
 网络加载等待条
 
 @param statusText 文字 默认正在加载
 @param imageName 图片名 默认是白色圆圈
 @param view 需要加载哪个视图上 默认window
 */
+ (void)showLoading:(NSString *)statusText loadImageName:(NSString *)imageName inView:(UIView *)view {
    if ([self isBlankString:statusText]) {
        statusText = @"正在加载";
    }
    if ([self isBlankString:imageName]) {
        imageName = @"tips_icon_refresh_white";
    }
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    hud.bezelView.layer.cornerRadius = 5.0f;
    hud.detailsLabel.text = statusText;
    hud.margin = 25;
    hud.contentColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:14];
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;
    [hud.customView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
}

/**
 隐藏loadingView
 
 @param view HUD父视图 animated 动画
 */
+ (void)hideLoadingHUD:(UIView *)view animated:(BOOL)animated {
    if (view == nil) {
        view = [[[UIApplication sharedApplication] delegate] window];
    }
    [MBProgressHUD hideHUDForView:view animated:animated];
}

@end

