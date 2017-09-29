//
//  InteractionCollectionViewCell.m
//  bideli
//
//  Created by 余钦 on 2017/8/29.
//  Copyright © 2017年   reserved.
//

#import "InteractionCollectionViewCell.h"
@interface InteractionCollectionViewCell ()
@property (nonatomic, weak)UIImageView *iconView;
@property (nonatomic, weak)UILabel *titleLabel;
@end

@implementation InteractionCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self SetupSubviews];
    }
    return self;
}

- (void)SetupSubviews {
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage imageNamed:@"purchase"];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"采购原石";
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:rFontSize(14)];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak __typeof(self)wself = self;
    CGFloat iconW = rHeight(24);
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.contentView).offset(rHeight(10));
        make.centerX.mas_equalTo(wself.contentView);
        make.width.height.mas_equalTo(iconW);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.mas_equalTo(wself.contentView);
        make.top.mas_equalTo(wself.iconView.mas_bottom).offset(rHeight(18));
        make.height.mas_equalTo(rHeight(16));
    }];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setIcon:(NSString *)icon {
    _icon = icon;
    self.iconView.image = [UIImage imageNamed:icon];
}
@end
