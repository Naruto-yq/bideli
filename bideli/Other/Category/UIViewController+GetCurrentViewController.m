//
//  UIViewController+GetCurrentViewController.m
//  EventAspect
//
//  Created by jjs-imac-qhy on 11/4/2016.
//  Copyright © 2016 Qhy. All rights reserved.
//

#import "UIViewController+GetCurrentViewController.h"

@implementation UIViewController (GetCurrentViewController)

+ (instancetype)getCurrentViewController{

    UIViewController *result = nil;
    UIWindow * window  = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder  = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if([nextResponder isKindOfClass:[UINavigationController class]]){
        UINavigationController *navi = (UINavigationController *)nextResponder;
        result = [navi.viewControllers lastObject];
    }
    else
        result = window.rootViewController;
    
    if ([result isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabCtl = (UITabBarController *)result;
        result = tabCtl.selectedViewController;
        if ([result isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navi = (UINavigationController *)result;
            result = [navi.viewControllers lastObject];
        }
    }
    if (result == nil) {
        result = window.rootViewController;
    }
    
    return result;
}

@end
