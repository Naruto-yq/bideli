//
//  QJTabBarButton.m
//  SinaProj
//
//  Created by 杨丽娟 on 15/12/26.
//  Copyright © 2015年 Qin.Yu. All rights reserved.
//

#import "QJTabBarButton.h"

//image ratio
#define QJTabBarButtonImageRatio 0.6

@interface QJTabBarButton ()
@end

@implementation QJTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //只需要设置一次的放置在这里
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        [self setTitleColor:HEXCOLOR(0xfbd860) forState:UIControlStateSelected];
        

        [self setTitleColor:HEXCOLOR(0xbfbfbf)forState:UIControlStateNormal];
    
    }
    return self;
}

//重写该方法可以去除长按按钮时出现的高亮效果
- (void)setHighlighted:(BOOL)highlighted
{
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = 23;
    CGFloat imageH = imageW;//contentRect.size.height*QJTabBarButtonImageRatio;
    
    return CGRectMake((ViewW(self)-imageW)/2, 4, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height*QJTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    _tabBarItem = tabBarItem;
    // KVO 监听属性改变
    [tabBarItem addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.tabBarItem removeObserver:self forKeyPath:@"badgeValue"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    [self setTitle:self.tabBarItem.title forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.image forState:UIControlStateNormal];
    [self setImage:self.tabBarItem.selectedImage forState:UIControlStateSelected];
}
@end
