//
//  ResultDetailVC.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "ResultDetailVC.h"
#import "SharerInfo.h"
#import "OrderView.h"
#import "OrderProgressView.h"

@interface ResultDetailVC ()
@property (nonatomic, weak) OrderView *orderView;
@property (nonatomic, weak) UIButton *finishButton;
@end

@implementation ResultDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MyLocalizedString(@"MyOrder");

    [self setupSubviews];
}

- (void)setupSubviews {
    OrderView *orderView = [[OrderView alloc] init];
    orderView.frame = CGRectMake(0, 0, ViewW(self.view), rHeight(108));
    [self.view addSubview:orderView];
    self.orderView = orderView;
    
    self.orderView.money = self.money;
    self.orderView.orderNum = @"890923";
    self.orderView.sharerName = self.sharerInfo.name;
    
    OrderProgressView *orderProgressView = [[OrderProgressView alloc] init];
    orderProgressView.frame = CGRectMake(0, rHeight(108)+10, ViewW(self.view), ViewH(self.view)-(rHeight(108)+10+64+30));
    [self.view addSubview:orderProgressView];
    
    UIButton *finishButton = [[UIButton alloc] init];
    finishButton.frame = CGRectMake(0, CGRectGetMaxY(orderProgressView.frame), ViewW(self.view), 30);
    [finishButton setTitle:@"完成" forState:UIControlStateNormal];
    [finishButton setBackgroundColor:ConfirmButtonNormalColor];
    [finishButton addTarget:self action:@selector(clickFinishButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:finishButton];
    self.finishButton = finishButton;
}

- (void) clickFinishButton {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
