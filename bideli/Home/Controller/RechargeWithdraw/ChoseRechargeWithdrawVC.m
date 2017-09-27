//
//  ChoseRechargeWithdrawVC.m
//  bideli
//
//  Created by 余钦 on 2017/9/26.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "ChoseRechargeWithdrawVC.h"
#import "RechargeWithdrawCell.h"
#import "RechargeVC.h"
#import "WithdrawVC.h"

@interface ChoseRechargeWithdrawVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ChoseRechargeWithdrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_64) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.sectionHeaderHeight = 9;
    _tableView.sectionFooterHeight = 0;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *titleArr = @[@"充值", @"提现"];
    RechargeWithdrawCell *cell = [RechargeWithdrawCell cellWithTableView:tableView];
    cell.title = titleArr[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        RechargeVC *rechargeVc = [[RechargeVC alloc] init];
        [self.navigationController pushViewController:rechargeVc animated:YES];
    }else if (indexPath.row == 1) {
        WithdrawVC *withdrawVc = [[WithdrawVC alloc] init];
        [self.navigationController pushViewController:withdrawVc animated:YES];
    }
}
@end
