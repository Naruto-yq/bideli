//
//  InputPhoneNoViewController.m
//  app
//
//  Created by 余钦 on 16/6/3.
//
//

#import "InputPhoneNoViewController.h"
#import "CheckMsgCodeViewController.h"

@interface InputPhoneNoViewController ()
@property (nonatomic, weak)OneFieldView *phoneNumFieldView;
@property (nonatomic, weak)UIButton *nextButton;
@end

@implementation InputPhoneNoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"设置登录密码";
    [self setupSubviews];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
}

- (void)setupSubviews {
    OneFieldView *phoneNumFieldView = [[OneFieldView alloc] init];
    phoneNumFieldView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH);
    phoneNumFieldView.labelText = @"手机号码";
    phoneNumFieldView.textField.keyboardType = UIKeyboardTypeNumberPad;
    phoneNumFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入您的手机号"];
    [phoneNumFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:phoneNumFieldView];
    self.phoneNumFieldView = phoneNumFieldView;
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.clipsToBounds = YES;
    nextButton.enabled = NO;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.phoneNumFieldView.frame)+30, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(ClickNextStepButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}

- (void)ClickNextStepButton {
    CheckMsgCodeViewController *checkMsgCodeVc = [[CheckMsgCodeViewController alloc] init];
    checkMsgCodeVc.rootPopVc = self.rootPopVc;
    checkMsgCodeVc.phoneNum = self.phoneNumFieldView.textField.text;
    checkMsgCodeVc.countdownSecond = 90;
    [self.navigationController pushViewController:checkMsgCodeVc animated:YES];
}

- (void)textFieldChange:(UITextField *)textField
{
    if (textField.text.length > 11) {
        self.nextButton.enabled = YES;
        textField.text = [textField.text substringToIndex:11];
    }else {
        self.nextButton.enabled = NO;
    }
}
@end
