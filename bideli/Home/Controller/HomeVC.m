//
//  HomeVC.m
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "HomeVC.h"
#import "PurchaseStoneVC.h"
#import "TradeVC.h"
#import "BannerView.h"
#import "InteractionCell.h"
#import "AssetCell.h"
#import "ItemInfo.h"

@interface HomeVC ()<UITableViewDelegate, UITableViewDataSource, BannerViewDelegate, InteractionCellDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)BannerView  *bannerView;
@property(nonatomic, strong)BannerView  *brandBannerView;
@property (nonatomic, strong)NSMutableArray *itemArray;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = MyLocalizedString(@"Home");
    
    [self setupTableView];
    
    
    NSArray *itemDicts = @[
                            @{@"title": @"采购原石",@"icon":@"purchase"}, @{@"title": @"寻宝",@"icon":@"purchase"}, @{@"title": @"交易",@"icon":@"trade"},
                            @{@"title": @"充值提现",@"icon":@"rechargewithdraw"}, @{@"title": @"商城",@"icon":@"mall"}, @{@"title": @"支付",@"icon":@"purchase"},
                            @{@"title": @"预留",@"icon":@"purchase"}, @{@"title": @"预留",@"icon":@"purchase"}, @{@"title": @"预留",@"icon":@"purchase"},
                            ];
    
    for (NSDictionary* dic in itemDicts) {
        ItemInfo *itemInfo = [ItemInfo mj_objectWithKeyValues:dic];
        [self.itemArray addObject:itemInfo];
    }
}

- (void)setupTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = HEXCOLOR(0xf5f5f5);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSMutableArray *)itemArray {
    if (_itemArray == nil) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (BannerView *)bannerView {
    if (_bannerView == nil) {
        _bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HomeBannerH)];
    }
    return _bannerView;
}

- (BannerView *)brandBannerView {
    if (_brandBannerView == nil) {
        _brandBannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 6, SCREEN_WIDTH, rHeight(80))];
    }
    return _brandBannerView;
}

#pragma mark --- tableView delegate & datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return eHomeSectionName_end;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == eHomeSectionName_Banner) {
        return 0;
    }else if (section == eHomeSectionName_Asset) {
        return 1;
    }else if (section == eHomeSectionName_Interaction) {
        return 1;
    }else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == eHomeSectionName_Interaction) {
        return InteractionCellH;
    }else if (indexPath.section == eHomeSectionName_Asset) {
        return 90;
    }else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == eHomeSectionName_Interaction) {
        InteractionCell *cell = [InteractionCell cellWithTableView:tableView];
        cell.interactionArray = self.itemArray;
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == eHomeSectionName_Asset) {
        AssetCell *cell = [AssetCell cellWithTableView:tableView];
        return cell;
    }else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == eHomeSectionName_Banner) {
        return HomeBannerH;
    }else if (section == eHomeSectionName_Asset) {
        return 0;
    }else if (section == eHomeSectionName_Interaction) {
        return 10;
    }else if (section == eHomeSectionName_Brand) {
        return rHeight(80);
    }else {
        return 0;
    }

}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == eHomeSectionName_Banner) {
        UIView *headerView = [[UIView alloc]init];
        headerView.backgroundColor = [UIColor clearColor];
        headerView.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 0);
        [headerView addSubview:self.bannerView];
        self.bannerView.imageName = @"hupo_banner";
        self.bannerView.delegate = self;
        return headerView;
    }else if (section == eHomeSectionName_Brand) {
        UIView *headerView = [[UIView alloc]init];
        headerView.backgroundColor = [UIColor clearColor];
        headerView.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 0);
        [headerView addSubview:self.brandBannerView];
        self.brandBannerView.imageName = @"footer_banner";
        self.brandBannerView.delegate = self;
        return headerView;
    }

    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == eHomeSectionName_Interaction) {
        UIView *footerView = [[UIView alloc]init];
        footerView.backgroundColor = [UIColor clearColor];
        footerView.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 0);
        [footerView addSubview:self.brandBannerView];
        self.brandBannerView.imageName = @"footer_banner";
        self.brandBannerView.delegate = self;
        return footerView;
    }
    return [UIView new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)interactionCell:(InteractionCell *)cell DidSelectedAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            PurchaseStoneVC *purchaseVc = [[PurchaseStoneVC alloc] init];
            [self.navigationController pushViewController:purchaseVc animated:YES];
        }
            break;
            
        case 2:
        {
            TradeVC *tradeVc = [[TradeVC alloc] init];
            [self.navigationController pushViewController:tradeVc animated:YES];
        }
            break;


            
        default:
            break;
    }
}

#pragma mark -- bannerView delegate
- (void)bannerView:(BannerView *)bannerView didSelectedAtIndex:(NSInteger)nIndex {
}
@end
