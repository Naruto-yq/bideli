//
//  BannerView.h
//  cmbfaeApp
//
//  Created by 余钦 on 16/4/6.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HomeBannerH ((SCREEN_WIDTH)/3)

static NSString *ID = @"bannerCell";

@class BannerView;
@protocol BannerViewDelegate <NSObject>

@optional
- (void)bannerView:(BannerView *)bannerView didSelectedAtIndex:(NSInteger)nIndex;

@end

@interface BannerView : UIView
@property(nonatomic, strong)NSArray *imagePathArray;
@property(nonatomic, strong)NSString *imageName;
@property(nonatomic, assign)CGFloat autoScrollTimeInterval;
@property(nonatomic, weak)id<BannerViewDelegate>  delegate;
- (void)startScrollBanner;
- (void)stopScrollBanner;
//+ (instancetype)bannerViewWithFrame:(CGRect)frame imagePathArray:(NSArray *)imagePathArray;

@end
