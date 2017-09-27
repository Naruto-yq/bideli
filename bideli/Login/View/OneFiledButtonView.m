//
//  OneFiledButtonView.m
//  zzlc
//
//  Created by 余钦 on 2016/11/15.
//  Copyright © 2016年 CMB QIANHAI FINANCIAL ASSET EXCHANGE. All rights reserved.
//

#import "OneFiledButtonView.h"

@interface OneFiledButtonView ()
@property (nonatomic, weak)UIView *lineView;
@end

@implementation OneFiledButtonView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self SetupSubViews];
    }
    return self;
}


- (void)SetupSubViews {
    UILabel *label = [UILabel new];
    label.textColor = IndicateLabelTextColor;
    label.font = [UIFont systemFontOfSize:IndicateLabelTFontSize];
    [self addSubview:label];
    self.label = label;
    
    UITextField *textField = [UITextField new];
    textField.clearButtonMode =  UITextFieldViewModeWhileEditing;
    textField.textColor = IndicateFieldTextColor;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.font = [UIFont systemFontOfSize:IndicateFieldTFontSize];
    textField.backgroundColor = IndicateFieldBgColor;
    [self addSubview:textField];
    self.textField = textField;
    
    UICountdownButton *button = [[UICountdownButton alloc] init];
    button.titleLabel.font = [UIFont systemFontOfSize:IndicateCountDownBtnFontSize];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = 3.0f;
    [button setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [self addSubview:button];
    self.button = button;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = LineColor;
    [self addSubview:lineView];
    self.lineView = lineView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof (self)wself = self;
    
    if (self.labelText.length) {
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(IndicateLeftMargin);
            make.centerY.mas_equalTo(wself.mas_centerY);
            make.width.mas_equalTo(IndicateLabelW);
            make.height.mas_equalTo(IndicateLabelH);
        }];
    }else {
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(IndicateLeftMargin);
            make.centerY.mas_equalTo(wself.mas_centerY);
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(IndicateLabelH);
        }];
    }
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.width.mas_equalTo(IndicateButtonW);
        make.height.mas_equalTo(IndicateFieldH);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.label.mas_right).offset(IndicateControlMargin);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.right.mas_equalTo(wself.button.mas_left).offset(-IndicateControlMargin);
        make.height.mas_equalTo(IndicateFieldH);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.mas_left).offset(IndicateLeftMargin);
        make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
        make.bottom.mas_equalTo(wself);
        make.height.mas_equalTo(IndicateViewLineH);
    }];
}

- (void)setLabelText:(NSString *)labelText {
    _labelText = labelText;
    self.label.text = labelText;
    if (_labelText.length) {
        __weak __typeof (self)wself = self;
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(IndicateLeftMargin);
            make.centerY.mas_equalTo(wself.mas_centerY);
            make.width.mas_equalTo(IndicateLabelW);
            make.height.mas_equalTo(IndicateLabelH);
        }];
    }else {
        self.label.frame = CGRectZero;
    }
}

- (void)setBorderStyle:(ZZLCTextFieldBorderStyle)borderStyle {
    _borderStyle = borderStyle;
    
    if (_borderStyle == ZZLCTextFieldBorderStyleRoundedRect) {
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        self.textField.backgroundColor = IndicateFieldBgColor;
    }else {
        self.textField.borderStyle = UITextBorderStyleNone;
        self.textField.backgroundColor = self.backgroundColor;
    }
}
@end
