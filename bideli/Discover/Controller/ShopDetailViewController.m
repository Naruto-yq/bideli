//
//  ShopDetailViewController.m
//  bideli
//
//  Created by Yanglijuan on 2017/9/29.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "ShopDetailViewController.h"
#import "shopInfoView.h"

@interface ShopDetailViewController ()

@property (nonatomic, strong) shopInfoView *shopView;

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeBaseView];
    
}

- (void)initializeBaseView {
    self.navigationItem.title = self.shopTitle ? : @"店铺详情";
    self.shopView = [shopInfoView createWithNib];
    self.shopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self.view addSubview:self.shopView];
    
}


@end
