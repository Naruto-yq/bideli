//
//  UICountdownButton.m
//  CountdownButton
//
//  Created by 余钦 on 16/3/17.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "UICountdownButton.h"
#define STCountDownConstStartText @"获取验证码"
#define STCountDownConstEndText   @"重新获取"

@interface UICountdownButton ()
@property(nonatomic, assign) NSInteger totalSecond;
@property(nonatomic, strong)NSTimer *timer;
@end
@implementation UICountdownButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setTitle:STCountDownConstStartText forState:UIControlStateNormal];
        _second = 0;
    }
    return self;
}

- (void)start
{
    self.enabled = NO;
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stop
{
    self.enabled = YES;
    self.totalSecond = self.second;
    [self setTitle:STCountDownConstEndText forState:UIControlStateNormal];
    [self setTitle:STCountDownConstEndText forState:UIControlStateDisabled];
    
    if (self.timer) {
        if ([self.timer respondsToSelector:@selector(isValid)]) {
            if ([self.timer isValid]) {
                [self.timer invalidate];
                self.timer = nil;
            }
        }
    }
}

- (void)setSecond:(NSInteger)second
{
    _second = second;
    _totalSecond = second;
}

- (void)timerCountdown:(NSTimer *)timer
{
    self.totalSecond--;
    if (self.totalSecond <= 0) {
        [self stop];
    }else{
        NSString *title = [NSString stringWithFormat:@"剩余%ld秒", self.totalSecond];
        [self setTitle:title forState:UIControlStateDisabled]; 
    }
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerCountdown:) userInfo:nil repeats:YES];
    }
    return _timer;
}
@end
