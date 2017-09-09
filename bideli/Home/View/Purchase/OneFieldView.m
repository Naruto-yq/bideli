//
//  OneFieldView.m
//  zzlc
//
//  Created by 余钦 on 16/11/7.
//  Copyright © 2016年 CMB QIANHAI FINANCIAL ASSET EXCHANGE. All rights reserved.
//

#import "OneFieldView.h"

@interface OneFieldView ()
@property (nonatomic, weak) UILabel *unitLabel;
@end

@implementation OneFieldView

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
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textColor = IndicateFieldTextColor;
    textField.backgroundColor = IndicateFieldBgColor;
    textField.font = [UIFont systemFontOfSize:IndicateFieldTFontSize];
    [self addSubview:textField];
    self.textField = textField;
    
    UILabel *unitLabel = [UILabel new];
    unitLabel.text = MyLocalizedString(@"stoneUnit");
    unitLabel.textColor = HEXCOLOR(0x333333);
    unitLabel.font = [UIFont systemFontOfSize:IndicateLabelTFontSize];
    [self addSubview:unitLabel];
    self.unitLabel = unitLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof (self)wself = self;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(IndicateLeftMargin);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.width.mas_equalTo(IndicateLabelW);
        make.height.mas_equalTo(IndicateLabelH);
    }];
    
    [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wself.mas_right).offset(-IndicateRightMargin);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.height.mas_equalTo(wself);
        make.width.mas_equalTo(rWidth(32));
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself.label.mas_right).offset(IndicateControlMargin);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.right.mas_equalTo(wself.unitLabel.mas_left);
        make.height.mas_equalTo(IndicateFieldH);
    }];
}

- (void)setLabelText:(NSString *)labelText {
    _labelText = labelText;
    self.label.text = labelText;
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
