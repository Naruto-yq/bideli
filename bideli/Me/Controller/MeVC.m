//
//  MeVC.m
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "MeVC.h"
#import "MeCell.h"

#define SectionNumber 3

@interface MeVC ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *stringArray;
@property(nonatomic, strong)NSArray *imageArray;
@property(nonatomic, strong)NSArray *destVcClassArray;
@property(nonatomic, strong)UIImage *icon;
@property(nonatomic, assign)NSUInteger bankCardCount;
@property(nonatomic, assign)BOOL bGettingBankcard;
@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = MyLocalizedString(@"Me");
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (NSArray *)stringArray{
    if (!_stringArray) {
        _stringArray = [[NSArray alloc]init];
    }
    return _stringArray;
}

- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [[NSArray alloc]init];
    }
    return _imageArray;
}

- (NSArray *)destVcClassArray{
    if (!_destVcClassArray) {
        _destVcClassArray = [[NSArray alloc]init];
    }
    return _destVcClassArray;
}

- (void)setupLocalData {
    NSArray *secondString = @[MyLocalizedString(@"BankCard"), MyLocalizedString(@"PasswordManagement"), MyLocalizedString(@"SystemSetting"), MyLocalizedString(@"MessageManager")];
    NSArray *secondImage = @[@"bankcard_icon", @"password_icon", @"setting_icon"];
    NSArray *secondDestVcClass = @[@"BankCardListVC", @"PasswordManagementViewController", @"MessageViewController"];
    
    NSArray *thirdString = @[MyLocalizedString(@"Feedback"), MyLocalizedString(@"Aboutus")];
    NSArray *thirdImage = @[@"feedback_icon", @"aboutus_icon"];
    NSArray *thirdDestVcClass = @[@"MyprizeViewController", @"/pages/u_invite.html?inapp=1"];
    
    NSArray *firstString = @[MyLocalizedString(@"PhoneNumber")];
    NSArray *stringArray = @[firstString, secondString, thirdString, ];
    self.stringArray = stringArray;
    
    NSArray *firstImage = @[@"account_balance"];
    NSArray *ImageArray = @[firstImage, secondImage, thirdImage];
    self.imageArray = ImageArray;
    
    NSArray *firstDestVcClass = @[@"UserInfoVC"];
    NSArray *destVcClassArray = @[firstDestVcClass, secondDestVcClass, thirdDestVcClass];
    self.destVcClassArray = destVcClassArray;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.imageArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *images = self.imageArray[section];
    return images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MeCell *cell = [MeCell cellWithTableView:tableView];
    if (indexPath.section != 0) {
        NSArray *iconNameArr = self.imageArray[indexPath.section];
        cell.iconName = iconNameArr[indexPath.row];
        NSArray *titleArr = self.stringArray[indexPath.section];
        cell.title = titleArr[indexPath.row];
    }
    
    cell.indexPath = indexPath;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 72;
    }else{
        return 55;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *destClassArr = self.destVcClassArray[indexPath.section];
    NSString *destVcStr = destClassArr[indexPath.row];
    Class destClass = NSClassFromString(destVcStr);
    UIViewController *destVc = [[destClass alloc] init];
    if (destVc) {
        [self.navigationController pushViewController:destVc animated:YES];
    }
}
@end
