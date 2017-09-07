//
//  LatestProfitButton.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/3/29.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "LatestProfitButton.h"

#define titleRatio (0.6)
#define titleFontSize 13.0f

@interface LatestProfitButton ()
@property(nonatomic, assign)CGSize titleSize;
@end

@implementation LatestProfitButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        //高亮时不要自动调整图标高亮
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:rFontSize(titleFontSize)];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width*titleRatio;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageX = contentRect.size.width*titleRatio;
    CGFloat imageW = contentRect.size.width*(1 - titleRatio);
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    CGRect frame = self.frame;
    
    _titleSize = titleSize;
    
    frame.size.width = titleSize.width + 30;
    self.frame = frame;
    
    [super setTitle:title forState:state];
}

- (void)setFrame:(CGRect)frame
{
    frame.size.width = _titleSize.width + 30;
    
    [super setFrame:frame];
}
@end
