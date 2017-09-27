//
//  AssetCell.m
//  bideli
//
//  Created by 杨丽娟 on 17/8/29.
//  Copyright © 2017年   reserved.
//

#import "AssetCell.h"
#import "LatestProfitButton.h"
@interface AssetCell ()
@property(nonatomic, weak)LatestProfitButton *assetButton;
@property(nonatomic, weak)UILabel *stoneLabel;
@property(nonatomic, weak)UILabel *balanceLabel;
@property(nonatomic, weak)UILabel *stoneTitleLabel;
@property(nonatomic, weak)UILabel *balanceTitleLabel;
@end

@implementation AssetCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"AssetCell";
    AssetCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[AssetCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    LatestProfitButton *assetButton = [[LatestProfitButton alloc] init];
    [assetButton setImage:[UIImage imageNamed:@"black_eye_open"] forState:UIControlStateNormal];
    [assetButton setImage:[UIImage imageNamed:@"black_eye_close"] forState:UIControlStateSelected];
    [assetButton setTitle:@"总资产" forState:UIControlStateNormal];
    [assetButton setTitleColor:HEXCOLOR(0x999999) forState:UIControlStateNormal];
    [assetButton addTarget:self action:@selector(clickTotalAssetBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:assetButton];
    self.assetButton = assetButton;
    
    UILabel *stoneLabel = [UILabel new];
    stoneLabel.font = [UIFont systemFontOfSize:14];
    stoneLabel.text = @"109";
    stoneLabel.textAlignment = NSTextAlignmentLeft;
    stoneLabel.textColor = HEXCOLOR(0x333333);
    [self addSubview:stoneLabel];
    self.stoneLabel = stoneLabel;
    
    UILabel *balanceLabel = [UILabel new];
    balanceLabel.font = [UIFont systemFontOfSize:14];
    balanceLabel.text = @"26000.00";
    balanceLabel.textAlignment = NSTextAlignmentLeft;
    balanceLabel.textColor = HEXCOLOR(0x333333);
    [self addSubview:balanceLabel];
    self.balanceLabel = balanceLabel;
    
    UILabel *stoneTitleLabel = [UILabel new];
    stoneTitleLabel.font = [UIFont systemFontOfSize:13];
    stoneTitleLabel.text = @"原石(克)";
    stoneTitleLabel.textAlignment = NSTextAlignmentLeft;
    stoneTitleLabel.textColor = HEXCOLOR(0x888888);
    [self addSubview:stoneTitleLabel];
    self.stoneTitleLabel = stoneTitleLabel;
    
    UILabel *balanceTitleLabel = [UILabel new];
    balanceTitleLabel.font = [UIFont systemFontOfSize:13];
    balanceTitleLabel.text = @"余额(元)";
    balanceTitleLabel.textAlignment = NSTextAlignmentLeft;
    balanceTitleLabel.textColor = HEXCOLOR(0x888888);
    [self addSubview:balanceTitleLabel];
    self.balanceTitleLabel = balanceTitleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(self)wself = self;
    [self.assetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.contentView.mas_left).offset(20);
        make.top.mas_equalTo(wself.contentView);
        make.width.mas_equalTo(rWidth(76));
        make.height.mas_equalTo(30);
    }];
    
    [self.stoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.assetButton);
        make.top.mas_equalTo(wself.assetButton.mas_bottom);
        make.width.mas_equalTo(wself.contentView.bounds.size.width/2-20);
        make.height.mas_equalTo(30);
    }];
    
    [self.balanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.contentView.mas_right);
        make.left.mas_equalTo(wself.stoneLabel.mas_right);
        make.height.top.mas_equalTo(wself.stoneLabel);
    }];
    
    [self.stoneTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(wself.stoneLabel);
        make.top.mas_equalTo(wself.stoneLabel.mas_bottom);
        make.height.mas_equalTo(20);
    }];
    
    [self.balanceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.balanceLabel);
        make.width.top.height.mas_equalTo(wself.stoneTitleLabel);
    }];
}

- (void)clickTotalAssetBtn {
    self.assetButton.selected = !self.assetButton.selected;
    if ([_delegate respondsToSelector:@selector(assetViewdelegateClickAssetButtonWithState:)]) {
        [_delegate assetViewdelegateClickAssetButtonWithState:self.assetButton.selected];
    }
    if (self.assetButton.selected) {
        self.stoneLabel.text = @"***";
        self.balanceLabel.text = @"****";
    }else {
        self.stoneLabel.text = @"109";
        self.balanceLabel.text = @"26000.00";
    }

}
@end
