//
//  TradeVC.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年   reserved.
//

#import "TradeVC.h"

@interface TradeVC ()
@property (nonatomic, weak) UIImageView *bgView;
@property (nonatomic, weak) UILabel *titleLable;
@property (nonatomic, weak) UILabel *integalPointLabel;
@end

@implementation TradeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = MyLocalizedString(@"Trade");
    
    [self setupSubviews];
}

- (void)setupSubviews {
    UIImageView *bgView = [UIImageView new];
    bgView.image = [UIImage imageNamed:@"trade_bg.jpg"];
    bgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, ViewH(self.view));
    [self.view addSubview:bgView];
    
    UILabel *titleLable = [UILabel new];
    titleLable.frame = CGRectMake(0, rHeight(40), SCREEN_WIDTH, 40);
    titleLable.text = @"积分换大礼";
    titleLable.textColor = HEXCOLOR(0xfbd860);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont boldSystemFontOfSize:28];
    [self.view addSubview:titleLable];
    
    UILabel *integalPointLabel = [UILabel new];
    integalPointLabel.frame = CGRectMake(0, CGRectGetMaxY(titleLable.frame)+20, SCREEN_WIDTH, 30);
    integalPointLabel.textColor = [UIColor whiteColor];
    integalPointLabel.textAlignment = NSTextAlignmentCenter;
    integalPointLabel.text = @"您现在拥有的积分：9900";
    integalPointLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.view addSubview:integalPointLabel];
    
    UIButton *exchangeBtn = [[UIButton alloc] init];
    exchangeBtn.frame = CGRectMake(40, CGRectGetMaxY(integalPointLabel.frame)+20, SCREEN_WIDTH-80, 30);
    exchangeBtn.backgroundColor = HEXCOLOR(0xfbd860);
    exchangeBtn.layer.masksToBounds = YES;
    exchangeBtn.layer.cornerRadius = 4.0f;
    [exchangeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [exchangeBtn setTitle:@"立即兑换" forState:UIControlStateNormal];
    [exchangeBtn addTarget:self action:@selector(ClickExchangeBtn) forControlEvents:UIControlEventTouchUpInside];
    exchangeBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:exchangeBtn];
}

- (void)ClickExchangeBtn {
    
}
@end
