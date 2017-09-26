//
//  RechargeWithdrawCell.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/26.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "RechargeWithdrawCell.h"
@interface RechargeWithdrawCell ()
@property (nonatomic, weak) UIImageView *bgImageView;
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation RechargeWithdrawCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"rechargeWithdrawCell";
    RechargeWithdrawCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[RechargeWithdrawCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
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
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.image = [UIImage imageNamed:@"recharge_bg"];
    [self.contentView addSubview:bgImageView];
    self.bgImageView = bgImageView;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = HEXCOLOR(0xfbd860);
    titleLabel.font = [UIFont boldSystemFontOfSize:rFontSize(20)];
    titleLabel.textAlignment= NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    WeakSelf;
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.left.mas_equalTo(wself.contentView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.left.mas_equalTo(wself.contentView);
    }];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}
@end
