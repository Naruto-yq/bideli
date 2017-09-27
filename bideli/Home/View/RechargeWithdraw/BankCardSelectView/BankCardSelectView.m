//
//  BankCardSelectView.m
//  app
//
//  Created by 余钦 on 2017/5/22.
//
//

#import "BankCardSelectView.h"

@interface BankCardSelectView ()
@property (nonatomic, weak)UIImageView *iconView;
@property (nonatomic, weak)UILabel *bankNameLabel;
@property (nonatomic, weak)UILabel *bankTipLabel;
@end


@implementation BankCardSelectView
- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self SetupSubViews];
    }
    return self;
}


- (void)SetupSubViews {
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage imageNamed:@"card"];
    [self addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *bankNameLabel = [UILabel new];
    bankNameLabel.textColor = IndicateLabelTextColor;
    bankNameLabel.font = [UIFont systemFontOfSize:IndicateLabelTFontSize];
    [self addSubview:bankNameLabel];
    self.bankNameLabel = bankNameLabel;
    
    UILabel *bankTipLabel = [UILabel new];
    bankTipLabel.textColor = [UIColor redColor];
    bankTipLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:bankTipLabel];
    self.bankTipLabel = bankTipLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    WeakSelf;
    if (self.bankTipText.length) {
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(IndicateLeftMargin);
            make.centerY.mas_equalTo(wself.mas_centerY).offset(-10);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
    }else {
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(IndicateLeftMargin);
            make.centerY.mas_equalTo(wself.mas_centerY);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
    }
    
    if (self.bankTipText.length) {
        [self.bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(wself.iconView.mas_right).offset(25);
            make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
            make.centerY.mas_equalTo(wself.mas_centerY).offset(-10);
            make.height.mas_equalTo(IndicateLabelH);
        }];
    }else {
        [self.bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(wself.iconView.mas_right).offset(25);
            make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
            make.centerY.mas_equalTo(wself.mas_centerY);
            make.height.mas_equalTo(IndicateLabelH);
        }];
    }
    
    [self.bankTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(wself.bankNameLabel);
        make.bottom.mas_equalTo(wself.mas_bottom).offset(-10);
        make.height.mas_equalTo(16);
    }];
}

- (void)setBankName:(NSString *)bankName {
    _bankName = bankName;
    
    self.bankNameLabel.text = _bankName;
}

- (void)setBankTipText:(NSString *)bankTipText {
    _bankTipText = bankTipText;
    self.bankTipLabel.text = _bankTipText;
}
@end
