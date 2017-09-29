//
//  ChoseSharerCell.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年   reserved.
//

#import "ChoseSharerCell.h"
#import "CreditView.h"
#import "SharerInfo.h"

@interface ChoseSharerCell ()
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) CreditView *creditView;
@property (nonatomic, weak) UILabel *bankLabel;
@property (nonatomic, weak) UILabel *moneyLabel;
@property (nonatomic, weak) UILabel *rateLabel;
@end

@implementation ChoseSharerCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"ChoseSharerCell";
    ChoseSharerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ChoseSharerCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= 10;
    [super setFrame:frame];
}

- (void)setupSubviews {
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage imageNamed:@"share_icon"];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *nameLabel = [UILabel new];
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:rFontSize(15)];
    nameLabel.textAlignment= NSTextAlignmentLeft;
    [self.contentView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    CreditView *creditView = [[CreditView alloc] init];
    [self.contentView addSubview:creditView];
    self.creditView = creditView;
    
    UILabel *bankLabel = [UILabel new];
    bankLabel.textColor = HEXCOLOR(0x999999);
    bankLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
    bankLabel.textAlignment= NSTextAlignmentLeft;
    [self.contentView addSubview:bankLabel];
    self.bankLabel = bankLabel;
    
    UILabel *moneyLabel = [UILabel new];
    moneyLabel.textColor = [UIColor blackColor];
    moneyLabel.font = [UIFont systemFontOfSize:rFontSize(14)];
    moneyLabel.textAlignment= NSTextAlignmentRight;
    [self.contentView addSubview:moneyLabel];
    self.moneyLabel = moneyLabel;
    
    UILabel *rateLabel = [UILabel new];
    rateLabel.textColor = HEXCOLOR(0x999999);
    rateLabel.font = [UIFont systemFontOfSize:rFontSize(14)];
    rateLabel.textAlignment= NSTextAlignmentRight;
    [self.contentView addSubview:rateLabel];
    self.rateLabel = rateLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    WeakSelf;
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(rHeight(60));
        make.left.mas_equalTo(wself.contentView.mas_left).offset(IndicateLeftMargin);
        make.centerY.mas_equalTo(wself.contentView.mas_centerY);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.iconView);
        make.left.mas_equalTo(wself.iconView.mas_right).offset(rWidth(8));
        make.height.mas_equalTo(rHeight(20));
        make.width.mas_equalTo(rWidth(120));
    }];
    
    [self.creditView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(wself.nameLabel);
        make.top.mas_equalTo(wself.nameLabel.mas_bottom);
        make.height.mas_equalTo(rHeight(20));
    }];
    
    [self.bankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(wself.nameLabel);
        make.top.mas_equalTo(wself.creditView.mas_bottom);
        make.height.mas_equalTo(rHeight(20));
    }];

    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.contentView.mas_right).offset(-16);
        make.left.mas_equalTo(wself.nameLabel.mas_right);
        make.top.mas_equalTo(wself.nameLabel.mas_top).offset(-2);
        make.height.mas_equalTo(rHeight(24));
    }];

    [self.rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(wself.moneyLabel);
        make.top.mas_equalTo(wself.moneyLabel.mas_bottom);
        make.height.mas_equalTo(wself.creditView);
    }];
}

- (void)setMoney:(NSString *)money {
    self.moneyLabel.text = [NSString stringWithFormat:@"金额：%@", money];
    
}

- (void)setShareInfo:(SharerInfo *)shareInfo {
    self.nameLabel.text = shareInfo.name;
    self.creditView.creditCount = [shareInfo.credit integerValue];
    self.bankLabel.text = [NSString stringWithFormat:@"支付方式：%@", shareInfo.bankName];
    self.rateLabel.text = [NSString stringWithFormat:@"费率：%@%%", shareInfo.rate];
}
@end
