//
//  BannerViewCell.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/4/6.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "BannerViewCell.h"

@implementation BannerViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:imageView];
        _imageView = imageView;
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = self.contentView.frame;
}
@end
