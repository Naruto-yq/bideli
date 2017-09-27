//
//  BusinessPaoPaoView.h
//  bideli
//
//  Created by Yanglijuan on 2017/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapPointModel.h"
@class MapPointModel,BusinessPaoPaoView;

@protocol BusinessPaopaoViewDelagate <NSObject>

/**
 确定
 */
-(void)paopaoView:(BusinessPaoPaoView *)paopapView sureButtonClickWithPoi:(MapPointModel *)poi;
/**
 取消
 */
-(void)paopaoView:(BusinessPaoPaoView *)paopapView cancelButtonClickWithPoi:(MapPointModel *)poi;

@end


@interface BusinessPaoPaoView : UIView

@property (nonatomic, strong) MapPointModel *pointModel;
@property (nonatomic, weak) id<BusinessPaopaoViewDelagate> delegate;


+ (instancetype)createWithNib;

@end
