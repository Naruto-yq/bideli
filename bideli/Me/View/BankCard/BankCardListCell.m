//
//  BankCardListCell.m
//  app
//
//  Created by 余钦 on 2017/5/17.
//
//

#import "BankCardListCell.h"
#import "BankCardInfo.h"

#define bankNameFontSize rFontSize(17.0)
#define bankCardTypeFontSize rFontSize(12.0)


@interface BankCardListCell ()
@property (nonatomic, weak)UIImageView *bankCardWaterMarkView;
@property (nonatomic, weak)UIImageView *bankLogoView;
@property (nonatomic, weak)UILabel *bankNameLabel;
@property (nonatomic, weak)UILabel *bankCardTypeLabel;
@property (nonatomic, weak)UILabel *bankCardNumLabel;
@end

@implementation BankCardListCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"BankCardListCell";
    BankCardListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[BankCardListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = HEXCOLOR(0xf2f2f7);
        [self SetupSubviews];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.y += BankCardMarginY;
    frame.size.height -= BankCardMarginY;
    [super setFrame:frame];
}

- (void)SetupSubviews {
    UIImageView *bankCardWaterMarkView = [UIImageView new];
    [self.contentView addSubview:bankCardWaterMarkView];
    self.bankCardWaterMarkView = bankCardWaterMarkView;
    
    UIImageView *bankLogoView = [UIImageView new];
    [self.bankCardWaterMarkView addSubview:bankLogoView];
    self.bankLogoView = bankLogoView;
    
    UILabel *bankNameLabel = [UILabel new];
    bankNameLabel.font = [UIFont systemFontOfSize:bankNameFontSize];
    bankNameLabel.textColor = HEXCOLOR(0x363636);
    bankNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.bankCardWaterMarkView addSubview:bankNameLabel];
    self.bankNameLabel = bankNameLabel;
    
    UILabel *bankCardTypeLabel = [UILabel new];
    bankCardTypeLabel.font = [UIFont systemFontOfSize:bankCardTypeFontSize];
    bankCardTypeLabel.textColor = HEXCOLOR(0x222222);
    bankCardTypeLabel.textAlignment = NSTextAlignmentLeft;
    [self.bankCardWaterMarkView addSubview:bankCardTypeLabel];
    self.bankCardTypeLabel = bankCardTypeLabel;
    
    UILabel *bankCardNumLabel = [UILabel new];
    bankCardNumLabel.font = [UIFont systemFontOfSize:bankNameFontSize];
    bankCardNumLabel.textColor = HEXCOLOR(0x8c7623);
    bankCardNumLabel.textAlignment = NSTextAlignmentLeft;
    [self.bankCardWaterMarkView addSubview:bankCardNumLabel];
    self.bankCardNumLabel = bankCardNumLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    WeakSelf;
    [self.bankCardWaterMarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.contentView).offset(BankCardMarginX);
        make.right.mas_equalTo(wself.contentView).offset(-BankCardMarginX);
        make.top.height.mas_equalTo(wself.contentView);
    }];
    
    [self.bankLogoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.bankCardWaterMarkView).offset(10);
        make.centerY.mas_equalTo(wself.bankCardWaterMarkView);
        make.width.height.mas_equalTo(rWidth(42));
    }];
    
    [self.bankNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.bankLogoView.mas_right).offset(10);
        make.centerY.mas_equalTo(wself.bankCardWaterMarkView.mas_centerY).offset(-12);
        make.width.mas_equalTo(rWidth(70)+4);
        make.height.mas_equalTo(rHeight(24)+2);
    }];
    
    [self.bankCardTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.bankNameLabel.mas_right).offset(6);
        make.right.mas_equalTo(wself.bankCardWaterMarkView);
        make.bottom.mas_equalTo(wself.bankNameLabel);
        make.height.mas_equalTo(rHeight(24));
    }];
    
    [self.bankCardNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.bankNameLabel);
        make.top.mas_equalTo(wself.bankNameLabel.mas_bottom).offset(8);
        make.right.mas_equalTo(wself.bankCardWaterMarkView);
        make.height.mas_equalTo(bankNameFontSize + 4);
    }];
}

- (void)setBankCardInfo:(BankCardInfo *)bankCardInfo {
    _bankCardInfo = bankCardInfo;
    
    self.bankCardWaterMarkView.image = [UIImage imageNamed:_bankCardInfo.appwatermarklogo];
    self.bankLogoView.image = [UIImage imageNamed:_bankCardInfo.banklogo];
    self.bankNameLabel.text = _bankCardInfo.bankname;
    self.bankCardTypeLabel.text = _bankCardInfo.cardtype;
    self.bankCardNumLabel.text = _bankCardInfo.bankaccount;
    
    self.bankLogoView.hidden = NO;
    self.bankNameLabel.hidden = NO;
    self.bankCardNumLabel.hidden = NO;
    self.bankCardTypeLabel.hidden = NO;
}

- (void)setIsEmpty:(BOOL)isEmpty {
    _isEmpty = isEmpty;
    
    self.bankCardWaterMarkView.image = [UIImage imageNamed:@"card_empty"];
    self.bankLogoView.hidden = YES;
    self.bankNameLabel.hidden = YES;
    self.bankCardNumLabel.hidden = YES;
    self.bankCardTypeLabel.hidden = YES;
}
@end
