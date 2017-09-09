//
//  SelectAccountView.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "SelectAccountView.h"

@interface SelectAccountView ()
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *banknameLabel;
@property (nonatomic, weak) UILabel *bankCardNumLabel;
@property (nonatomic, weak) UIImageView *arrowView;
@end

@implementation SelectAccountView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = HEXCOLOR(0x000000);
    titleLabel.text = MyLocalizedString(@"Please select account");
    titleLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    titleLabel.textAlignment= NSTextAlignmentLeft;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *banknameLabel = [UILabel new];
    banknameLabel.textColor = HEXCOLOR(0x000000);
    banknameLabel.text = @"1111";
    banknameLabel.hidden = YES;
    banknameLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    banknameLabel.textAlignment= NSTextAlignmentLeft;
    [self addSubview:banknameLabel];
    self.banknameLabel = banknameLabel;
    
    UILabel *bankCardNumLabel = [UILabel new];
    bankCardNumLabel.hidden = YES;
    bankCardNumLabel.textColor = HEXCOLOR(0x999999);
    bankCardNumLabel.text = @"2222";
    bankCardNumLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    bankCardNumLabel.textAlignment= NSTextAlignmentLeft;
    [self addSubview:bankCardNumLabel];
    self.bankCardNumLabel = bankCardNumLabel;
    
    UIImageView *arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    [self addSubview:arrowView];
    self.arrowView = arrowView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(IndicateLeftMargin, 0, ViewW(self)-40, ViewH(self));
    
    self.banknameLabel.frame = CGRectMake(IndicateLeftMargin, 10, ViewW(self)-40, rHeight(20));
    self.bankCardNumLabel.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.banknameLabel.frame)+4, ViewW(self)-40, rHeight(20));
    
    self.arrowView.frame = CGRectMake(ViewW(self)-cellArrowW-IndicateRightMargin, (ViewH(self)-cellArrowW)/2, cellArrowW, cellArrowW);
}

- (void)setBankName:(NSString *)bankName {
    self.banknameLabel.text = [NSString stringWithFormat:@"%@  %@", @"张三",bankName];
    self.titleLabel.hidden = YES;
    self.banknameLabel.hidden = NO;
}

- (void)setBankCardNum:(NSString *)bankCardNum {
    self.bankCardNumLabel.text = bankCardNum;
    self.titleLabel.hidden = YES;
    self.bankCardNumLabel.hidden = NO;
}
@end
