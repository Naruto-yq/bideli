//
//  UICountdownButton.h
//  CountdownButton
//
//  Created by 余钦 on 16/3/17.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICountdownButton : UIButton
/**
 *  倒计时的秒数
 */
@property(nonatomic, assign)NSInteger second;

- (void)start;

- (void)stop;
@end
