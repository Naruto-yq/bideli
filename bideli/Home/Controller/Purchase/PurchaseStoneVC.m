//
//  PurchaseStoneVC.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "PurchaseStoneVC.h"
#import "OneFieldView.h"
#import "SelectAccountView.h"
#import "ChoseSharerVC.h"
#import "BankCardListVC.h"
#import "BankCardInfo.h"
#import "UIImage+ResizedImage.h"
#import "NSMutableAttributedString+CustomerAttributedString.h"

@interface PurchaseStoneVC ()<UITextFieldDelegate, BankCardListVcDelegate>
@property (nonatomic, weak) OneFieldView *stoneFieldView;
@property (nonatomic, weak) UILabel *tipLabel;
@property (nonatomic, weak) SelectAccountView *selectAccountView;
@property (nonatomic, weak) UIButton *nextButton;
@property (nonatomic, assign) BOOL *isSelectedAccount;
@end

@implementation PurchaseStoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MyLocalizedString(@"Purchase");
    [self setupSubviews];
}

- (void)setupSubviews {
    OneFieldView *stoneFieldView = [[OneFieldView alloc] init];
    stoneFieldView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH);
    stoneFieldView.labelText = MyLocalizedString(@"stoneWeight");
    stoneFieldView.textField.keyboardType = UIKeyboardTypeDecimalPad;
    stoneFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:MyLocalizedString(@"Please input stone weight")];
    stoneFieldView.borderStyle = ZZLCTextFieldBorderStyleNone;
    [stoneFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:stoneFieldView];
    self.stoneFieldView = stoneFieldView;
    
    UILabel *tipLabel = [UILabel new];
    tipLabel.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.stoneFieldView.frame), ViewW(self.view)-2*IndicateLeftMargin, rHeight(20));
    tipLabel.textColor = HEXCOLOR(0x999999);
    tipLabel.text = @"原石价格：95元/克";
    tipLabel.font = [UIFont systemFontOfSize:rFontSize(12)];
    tipLabel.textAlignment= NSTextAlignmentLeft;
    [self.view addSubview:tipLabel];
    self.tipLabel = tipLabel;
    
    SelectAccountView *selectAccountView = [[SelectAccountView alloc] init];
    selectAccountView.frame = CGRectMake(0, CGRectGetMaxY(self.tipLabel.frame), ViewW(self.view), 64);
    UIGestureRecognizer *tapRec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToSelectAccount)];
    [selectAccountView addGestureRecognizer:tapRec];
    [self.view addSubview:selectAccountView];
    self.selectAccountView = selectAccountView;

    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.enabled = NO;
    nextButton.clipsToBounds = YES;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.selectAccountView.frame)+30, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(clickNextStepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}

- (void)tapToSelectAccount {
    if (!self.stoneFieldView.textField.text.length) {
        self.tipLabel.text = @"请输入购买原石量";
        self.tipLabel.textColor = [UIColor redColor];
        return;
    }else {
        if ([self.stoneFieldView.textField.text floatValue] <= 30.0) {
            self.tipLabel.text = @"购买原石量不能小于30克";
            self.tipLabel.textColor = [UIColor redColor];
            return;
        }
    }
    BankCardListVC *bankCardListVc = [[BankCardListVC alloc] init];
    bankCardListVc.delegate = self;
    [self.navigationController pushViewController:bankCardListVc animated:YES];
}

- (void)clickNextStepBtn {
    ChoseSharerVC *choseSharerVc = [[ChoseSharerVC alloc] init];
    choseSharerVc.money = [NSString stringWithFormat:@"%.2f", 95*[self.stoneFieldView.textField.text floatValue]];
    [self.navigationController pushViewController:choseSharerVc animated:YES];
}

- (void)bankCardListVcSeletedBankCard:(BankCardInfo *)bankcardInfo {
    self.selectAccountView.bankName = bankcardInfo.bankname;
    self.selectAccountView.bankCardNum = bankcardInfo.bankaccount;
    self.isSelectedAccount = YES;
    [self textFieldChange:self.stoneFieldView.textField];
}

- (void)textFieldChange:(UITextField *)textField {
    self.tipLabel.textColor = HEXCOLOR(0x999999);
    self.tipLabel.text = @"原石价格：95元/克";
    if ([self.stoneFieldView.textField.text floatValue] >= 30.0 && self.isSelectedAccount) {
        self.nextButton.enabled = YES;
    }else {
        self.nextButton.enabled = NO;
    }
}
@end
