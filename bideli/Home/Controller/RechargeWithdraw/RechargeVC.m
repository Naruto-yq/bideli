//
//  RechargeVC.m
//  bideli
//
//  Created by 余钦 on 2017/9/26.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "RechargeVC.h"
#import "OneFieldView.h"
#import "UIImage+ResizedImage.h"
#import "ChoseSharerVC.h"

@interface RechargeVC ()
@property (nonatomic, weak) OneFieldView *moneyFieldView;
@property (nonatomic, weak) UIButton *nextButton;
@end

@implementation RechargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"充值";
    [self setupSubviews];
}

- (void)setupSubviews {
    OneFieldView *moneyFieldView = [[OneFieldView alloc] init];
    moneyFieldView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH);
    moneyFieldView.labelText = @"金额";
    moneyFieldView.textField.keyboardType = UIKeyboardTypeNumberPad;
    moneyFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入充值金额"];
    moneyFieldView.borderStyle = ZZLCTextFieldBorderStyleNone;
    [moneyFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:moneyFieldView];
    self.moneyFieldView = moneyFieldView;
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.enabled = NO;
    nextButton.clipsToBounds = YES;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.moneyFieldView.frame)+30, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(clickNextStepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}

- (void)clickNextStepBtn {
    ChoseSharerVC *choseSharerVc = [[ChoseSharerVC alloc] init];
    choseSharerVc.money = self.moneyFieldView.textField.text;
    [self.navigationController pushViewController:choseSharerVc animated:YES];
}

- (void)textFieldChange:(UITextField *)textField {
    if (self.moneyFieldView.textField.text.length) {
        self.nextButton.enabled = YES;
    }else {
        self.nextButton.enabled = NO;
    }
}
@end
