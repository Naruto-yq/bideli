//
//  QJMainTabBarController.m
//  SinaProj
//
//  Created by 杨丽娟 on 15/12/24.
//  Copyright © 2015年 Qin.Yu. All rights reserved.
//

#import "QJMainTabBarController.h"
#import "QJNavigationController.h"
#import "HomeVC.h"
#import "DiscoverVC.h"
#import "MeVC.h"
#import "QJTabBar.h"


@interface QJMainTabBarController ()<QJTabBarDelegate>
@property(nonatomic, weak) QJTabBar *customTabBar;
@property(nonatomic, strong)HomeVC *homeVc;
@property(nonatomic, strong)DiscoverVC *discoverVc;
@property(nonatomic, strong)MeVC *meVc;
@end

@implementation QJMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //init tabbar
    [self SetupTabbar];
    
    [self SetupAllControllers];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)SetupTabbar {
    QJTabBar *customerTabBar = [[QJTabBar alloc]init];
    customerTabBar.frame = self.tabBar.bounds;
    customerTabBar.delegate = self;
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 0.3);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [HEXCOLOR(0xffffff) CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
    
    [self.tabBar addSubview:customerTabBar];
    [self.tabBar bringSubviewToFront:customerTabBar];
    self.customTabBar = customerTabBar;
}

- (void)SetupAllControllers
{
    NSArray *titlesString = @[MyLocalizedString(@"Home"), @"发现", @"我"];
    NSArray *imageString = @[@"tabbar_home_normal", @"tabbar_map_normal", @"tabbar_me_normal"];
    NSArray *seletedImageString = @[@"tabbar_home_selected", @"tabbar_map_selected", @"tabbar_me_selected"];
    
    HomeVC *homeVc = [[HomeVC alloc] init];
    self.homeVc = homeVc;
    DiscoverVC *discoverVc = [[DiscoverVC alloc] init];
    self.discoverVc = discoverVc;
    MeVC *meVc = [[MeVC alloc] init];
    self.meVc = meVc;
    NSArray *viewControllers = @[homeVc, discoverVc, meVc];
    for (int nIndex = 0; nIndex < viewControllers.count; nIndex++) {
        [self setupChildViewController:viewControllers[nIndex] title:titlesString[nIndex] imageName:imageString[nIndex] selectedImageName:seletedImageString[nIndex]];
    }
}
#pragma mark -- init child controller
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString*)imageName selectedImageName:(NSString *)selectedImageName {
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    QJNavigationController *nav = [[QJNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

#pragma mark -- QJTabBar delegate
- (void)tabBar:(QJTabBar *)tabBar didSelectedButtonFrom:(long)FromBtnTag to:(long)toBtnTag {
    self.selectedIndex = toBtnTag;
}
@end
