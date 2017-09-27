//
//  LoginFieldView.m
//  app
//
//  Created by 余钦 on 2017/9/6.
//
//

#import "LoginFieldView.h"

@interface LoginFieldView ()
@end

@implementation LoginFieldView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self SetupSubViews];
    }
    return self;
}


- (void)SetupSubViews {
    UITextField *textField = [UITextField new];
    textField.clearButtonMode =  UITextFieldViewModeWhileEditing;
    textField.borderStyle = UITextBorderStyleNone;
    textField.textColor = HEXCOLOR(0x666666);
    textField.backgroundColor = [UIColor whiteColor];
    textField.font = [UIFont systemFontOfSize:IndicateFieldTFontSize];
    [self addSubview:textField];
    self.textField = textField;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HEXCOLOR(0x999999);
    [self addSubview:lineView];
    self.lineView = lineView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof (self)wself = self;

    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wself);
        make.centerY.mas_equalTo(wself.mas_centerY);
        make.right.mas_equalTo(wself.mas_right);
        make.height.mas_equalTo(ViewH(wself));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(wself);
        make.height.mas_equalTo(IndicateViewLineH);
    }];
}
@end


