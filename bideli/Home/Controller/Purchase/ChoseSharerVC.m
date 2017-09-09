//
//  ChoseSharerVC.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "ChoseSharerVC.h"
#import "ResultDetailVC.h"
#import "ChoseSharerCell.h"
#import "SharerInfo.h"

@interface ChoseSharerVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *sharerArray;
@end

@implementation ChoseSharerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MyLocalizedString(@"Sharer");
    [self setupTableView];
    [self setupLocalData];
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

- (void)setupLocalData {
    NSArray *sharerDicts = @[
                           @{@"name": @"ming",@"credit":@5, @"bankName": @"中国银行", @"rate": @"0.5"},
                           @{@"name": @"qin",@"credit":@3, @"bankName": @"工商银行", @"rate": @"0.5"},
                           @{@"name": @"yanjie",@"credit":@2, @"bankName": @"招商银行", @"rate": @"0.5"},
                           @{@"name": @"lijuan",@"credit":@4, @"bankName": @"建设银行", @"rate": @"0.5"},
                           @{@"name": @"zhangsan",@"credit":@1, @"bankName": @"交通银行", @"rate": @"0.5"},
                           @{@"name": @"lisi",@"credit":@3, @"bankName": @"农业银行", @"rate": @"0.5"},
                           ];
    
    for (NSDictionary *dic in sharerDicts) {
        SharerInfo *shareInfo = [SharerInfo mj_objectWithKeyValues:dic];
        [self.sharerArray addObject:shareInfo];
    }
    [self.tableView reloadData];
}

- (NSMutableArray *)sharerArray {
    if (_sharerArray == nil) {
        _sharerArray = [NSMutableArray array];
    }
    return _sharerArray;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sharerArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChoseSharerCell *cell = [ChoseSharerCell cellWithTableView:tableView];
    SharerInfo *shareInfo = self.sharerArray[indexPath.row];
    cell.shareInfo = shareInfo;
    cell.money = [NSString stringWithFormat:@"%.2f", [self.money floatValue] + [self.money floatValue]*([shareInfo.rate floatValue]/100)];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 94;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ResultDetailVC *resultVc = [[ResultDetailVC alloc] init];
    SharerInfo *shareInfo = self.sharerArray[indexPath.row];
    resultVc.sharerInfo = shareInfo;
    resultVc.money = [NSString stringWithFormat:@"%.2f", [self.money floatValue] + [self.money floatValue]*([shareInfo.rate floatValue]/100)];
    [self.navigationController pushViewController:resultVc animated:YES];
}

@end
