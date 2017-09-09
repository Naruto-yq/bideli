//
//  QJNavigationController.m
//  SinaProj
//
//  Created by 杨丽娟 on 15/12/26.
//  Copyright © 2015年 Qin.Yu. All rights reserved.
//

#import "QJNavigationController.h"
#import "UIBarButtonItem+NavleftBarButtonItem.h"

@interface QJNavigationController ()<UINavigationControllerDelegate>
@end

@implementation QJNavigationController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.delegate = self;
}
/**
 *  一个类只会调用一次，第一次使用这个类的时候会调用
 */
+ (void)initialize
{
    [self SetupNavBarTheme];
    
    [self SetupBarButtonItemTheme];
}

+ (void)SetupNavBarTheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:19];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [navBar setTitleTextAttributes:textAttrs];
}


+ (void)SetupBarButtonItemTheme
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.backgroundColor = [UIColor whiteColor];
    navBar.translucent = NO;
    
    UIBarButtonItem *barBtnItem = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //textAttrs[NSForegroundColorAttributeName] = RGB(248, 139, 0);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    textAttrs[NSShadowAttributeName] = shadow;
    [barBtnItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [barBtnItem setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
    
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barBtnItem setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航条的按钮
        UIBarButtonItem *popPre = [UIBarButtonItem barButtonItemWithImage:@"left_arrow_black" highImage:nil target:self action:@selector(popToPre)];
        viewController.navigationItem.leftBarButtonItem = popPre;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)popToPre
{
    [self popViewControllerAnimated:YES];
}

#pragma mark ---- navigation delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //删除系统自带的tabBarButton
    for (UIView *tabBar in self.tabBarController.tabBar.subviews) {
        if ([tabBar isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBar removeFromSuperview];
        }
    }
}
@end
