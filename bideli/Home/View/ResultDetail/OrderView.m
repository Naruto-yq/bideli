//
//  OrderView.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年   reserved.
//

#import "OrderView.h"

@interface OrderView ()
@property (nonatomic, weak) UILabel *orderLabel;
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UILabel *sharerNameLabel;
@property (nonatomic, weak) UILabel *moneyLabel;
@property (nonatomic, weak) UIButton *contactBtn;
@end

@implementation OrderView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UILabel *orderLabel = [UILabel new];
    orderLabel.textColor = HEXCOLOR(0x000000);
    orderLabel.text = MyLocalizedString(@"Please select account");
    orderLabel.font = [UIFont boldSystemFontOfSize:rFontSize(13)];
    orderLabel.textAlignment= NSTextAlignmentLeft;
    [self addSubview:orderLabel];
    self.orderLabel = orderLabel;
    
    UILabel *dateLabel = [UILabel new];
    dateLabel.textColor = HEXCOLOR(0x999999);
    dateLabel.text = @"2017-09-09 16:11";
    dateLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    dateLabel.textAlignment= NSTextAlignmentRight;
    [self addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = HEXCOLOR(0xeaeaea);
    [self addSubview:lineView];
    self.lineView = lineView;
    
    UILabel *sharerNameLabel = [UILabel new];
    sharerNameLabel.textColor = HEXCOLOR(0x000000);
    sharerNameLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    sharerNameLabel.textAlignment= NSTextAlignmentLeft;
    [self addSubview:sharerNameLabel];
    self.sharerNameLabel = sharerNameLabel;
    
    UILabel *moneyLabel = [UILabel new];
    moneyLabel.textColor = HEXCOLOR(0x000000);
    moneyLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    moneyLabel.textAlignment= NSTextAlignmentRight;
    [self addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;

    UIButton *contactBtn = [[UIButton alloc] init];
    contactBtn.titleLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    [contactBtn setTitleColor:ConfirmButtonNormalColor forState:UIControlStateNormal];
    [contactBtn setTitle:@"联系他" forState:UIControlStateNormal];
    [contactBtn.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    [contactBtn.layer setCornerRadius:3];
    [contactBtn.layer setBorderWidth:1];//设置边界的宽度
    [contactBtn.layer setBorderColor:ConfirmButtonNormalColor.CGColor];
    //[contactBtn addTarget:self action:@selector(clickNextStepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:contactBtn];
    self.contactBtn = contactBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    WeakSelf;
    [self.orderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself).offset(8);
        make.left.mas_equalTo(wself).offset(IndicateLeftMargin);
        make.height.mas_equalTo(rHeight(20));
        make.width.mas_equalTo(ViewW(self)/2 - IndicateLeftMargin);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
        make.width.top.height.mas_equalTo(wself.orderLabel);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.orderLabel);
        make.right.mas_equalTo(wself.dateLabel);
        make.top.mas_equalTo(wself.orderLabel.mas_bottom).offset(8);
        make.height.mas_equalTo(1);
    }];
    
    [self.sharerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(wself.orderLabel);
        make.top.mas_equalTo(wself.lineView.mas_bottom).offset(10);
        make.height.mas_equalTo(rHeight(20));
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.lineView.mas_right);
        make.top.height.width.mas_equalTo(wself.sharerNameLabel);
    }];
    
    [self.contactBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.moneyLabel);
        make.top.mas_equalTo(wself.moneyLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(rHeight(20));
        make.width.mas_equalTo(rWidth(60));
    }];
}

- (void)setOrderNum:(NSString *)orderNum {
    self.orderLabel.text = [NSString stringWithFormat:@"订单号：%@", orderNum];
}

- (void)setSharerName:(NSString *)sharerName {
    self.sharerNameLabel.text = [NSString stringWithFormat:@"收款人：%@", sharerName];;
}

- (void)setMoney:(NSString *)money {
    self.moneyLabel.text = [NSString stringWithFormat:@"应付：%@", money];
}
@end
