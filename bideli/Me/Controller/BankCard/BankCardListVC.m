//
//  BankCardListVC.m
//  app
//
//  Created by 余钦 on 2017/5/17.
//
//

#import "BankCardListVC.h"
#import "BankCardListCell.h"
#import "BankCardInfo.h"

@interface BankCardListVC () <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *bankCardArray;
@end

@implementation BankCardListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"银行卡";
    
    [self setupTableView];
    [self setupLocalData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT_64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.scrollsToTop = YES;
    [self.view addSubview:_tableView];
}

- (void)setupLocalData {
    NSArray *sharerDicts = @[
                             @{@"bankname":@"中国银行", @"bankaccount":@"**** **** 4967", @"bankcode": @"0104"},
                             ];
    
    for (NSDictionary *dic in sharerDicts) {
        BankCardInfo *bankcardInfo = [BankCardInfo mj_objectWithKeyValues:dic];
        [self.bankCardArray addObject:bankcardInfo];
    }
    [self.tableView reloadData];
}


- (NSMutableArray *)bankCardArray {
    if (_bankCardArray == nil) {
        _bankCardArray = [NSMutableArray array];
    }
    return _bankCardArray;
}

#pragma mark --- tableview datasource & delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.bankCardArray.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return BankCardListCellH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BankCardListCell *cell = [BankCardListCell cellWithTableView:tableView];
    if (indexPath.row == self.bankCardArray.count) {
        cell.isEmpty = YES;
    }else {
        cell.bankCardInfo = self.bankCardArray[indexPath.row];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ViewW(self.view), 0)];

    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.bankCardArray.count) {
        
    }else {
        [self.navigationController popViewControllerAnimated:YES];

        if ([self.delegate respondsToSelector:@selector(bankCardListVcSeletedBankCard:)]) {
            [self.delegate bankCardListVcSeletedBankCard:self.bankCardArray[indexPath.row]];
        }
    }
}

@end
