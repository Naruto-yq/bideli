//
//  QJTabBar.m
//  SinaProj
//
//  Created by 杨丽娟 on 15/12/25.
//  Copyright © 2015年 Qin.Yu. All rights reserved.
//

#import "QJTabBar.h"
#import "QJTabBarButton.h"

@interface QJTabBar ()
@property(nonatomic, strong)NSMutableArray *tabBarBtnArray;
@property(nonatomic, weak) QJTabBarButton *selectedBtn;
@property (nonatomic, weak)UIView *circleView;
@property (nonatomic, weak)UIView *btnBgView;
@end

@implementation QJTabBar

-(NSMutableArray *)tabBarBtnArray
{
    if (_tabBarBtnArray == nil) {
        _tabBarBtnArray = [NSMutableArray array];
    }
    return _tabBarBtnArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    UIView *circleView = [UIView new];
    circleView.layer.masksToBounds = YES;
    circleView.layer.cornerRadius = 30;
    circleView.backgroundColor = [UIColor whiteColor];
    [self addSubview:circleView];
    self.circleView = circleView;
    
    UIView *btnBgView = [UIView new];
    btnBgView.layer.masksToBounds = YES;
    btnBgView.layer.cornerRadius = 24;
    btnBgView.backgroundColor = HEXCOLOR(0xf5f5f5);
//    btnBgView.layer.shadowColor = [UIColor blackColor].CGColor;
//    btnBgView.layer.shadowOffset = CGSizeMake(0,0);
//    btnBgView.layer.shadowOpacity = 0.7f;
//    btnBgView.layer.shadowRadius = 4;
    [self addSubview:btnBgView];
    self.btnBgView = btnBgView;
}


- (void)TabBar_plusBtn_Click {
    if ([self.delegate respondsToSelector: @selector(tabBarDidClickedPlusButton:)]) {
        [self.delegate tabBarDidClickedPlusButton:self];
    }
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)tabBarItem {
    QJTabBarButton *button = [[QJTabBarButton alloc]init];
    [self addSubview:button];
    [self.tabBarBtnArray addObject:button];
    button.tabBarItem = tabBarItem;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.circleView.bounds = CGRectMake(0, 0, 60, 60);
    self.circleView.center = CGPointMake(self.center.x, self.center.y-10);
    
    self.btnBgView.center = self.circleView.center;
    self.btnBgView.bounds = CGRectMake(0, 0, 48, 48);
    
    CGFloat buttonW = self.frame.size.width/self.tabBarBtnArray.count;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    
    for (int nIndex = 0; nIndex < self.tabBarBtnArray.count; nIndex++) {
        CGFloat buttonX = buttonW*nIndex;
        QJTabBarButton *button = self.tabBarBtnArray[nIndex];
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = nIndex;
    }
    
    QJTabBarButton *button = self.tabBarBtnArray[1];
    button.center = CGPointMake(self.center.x, self.center.y-10);
    [self buttonClick:button];
}

- (void)buttonClick:(QJTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedBtn.tag to:button.tag];
    }
    
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
}
@end
