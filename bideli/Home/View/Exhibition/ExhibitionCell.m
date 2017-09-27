//
//  ExhibitionCell.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/26.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "ExhibitionCell.h"
@interface ExhibitionCell ()
@property (nonatomic, weak)UIImageView *imageView;
@property (nonatomic, weak)UILabel *titleLabel;
@end

@implementation ExhibitionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self SetupSubviews];
    }
    return self;
}

- (void)SetupSubviews {
    UIImageView *imageView = [UIImageView new];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = HEXCOLOR(0x333333);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    titleLabel.font = [UIFont systemFontOfSize:rFontSize(14)];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak __typeof(self)wself = self;
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.left.mas_equalTo(wself);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.bottom.mas_equalTo(wself.contentView);
        make.height.mas_equalTo(rHeight(20));
    }];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}
@end
