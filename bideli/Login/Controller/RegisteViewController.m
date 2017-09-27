//
//  RegisteViewController.m
//  app
//
//  Created by 余钦 on 16/4/25.
//
//
#import "RegisteViewController.h"
#import "SetPasswordViewController.h"
#import "NSMutableAttributedString+CustomerAttributedString.h"

@interface RegisteViewController ()
@property (nonatomic, weak)OneFieldView *phoneNumFieldView;
@property (nonatomic, weak)OneFiledButtonView *msgCodeFieldView;
@property (nonatomic, weak)UIButton *agreeBtn;
@property (nonatomic, weak)UIButton *protocolBtn;
@property (nonatomic, weak)UIButton *nextButton;
@end

@implementation RegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupSubviews];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
}

- (void)dealloc {
    [self.msgCodeFieldView.button stop];
}

- (void)setupSubviews {
    OneFieldView *phoneNumFieldView = [[OneFieldView alloc] init];
    phoneNumFieldView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH);
    phoneNumFieldView.labelText = @"手机号码";
    phoneNumFieldView.textField.keyboardType = UIKeyboardTypeNumberPad;
    phoneNumFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入您的手机号"];
    [phoneNumFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    if (self.phoneNum.length) {
        phoneNumFieldView.textField.text = self.phoneNum;
    }
    [self.view addSubview:phoneNumFieldView];
    self.phoneNumFieldView = phoneNumFieldView;
    
    OneFiledButtonView *msgCodeFieldView = [[OneFiledButtonView alloc] init];
    msgCodeFieldView.frame = CGRectMake(0, SubviewTopMarginY + FieldViewH, ViewW(self.view), FieldViewH);
    msgCodeFieldView.textField.keyboardType = UIKeyboardTypeNumberPad;
    msgCodeFieldView.labelText = @"验证码";
    msgCodeFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入验证码"];
    [msgCodeFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [msgCodeFieldView.button addTarget:self action:@selector(ClickGetMsgCodeBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgCodeFieldView];
    self.msgCodeFieldView = msgCodeFieldView;
    
    UIButton *agreeBtn = [[UIButton alloc] init];
    agreeBtn.frame = CGRectMake(IndicateLeftMargin, SubviewTopMarginY + FieldViewH*2 + 10, 54, 20);
    [agreeBtn setTitleColor:HEXCOLOR(0x888888) forState:UIControlStateNormal];
    [agreeBtn setTitle:@"同意" forState:UIControlStateNormal];
    agreeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    agreeBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    agreeBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
    [agreeBtn setImage:[UIImage imageNamed:@"checkbox_normal"] forState:UIControlStateNormal];
    [agreeBtn setImage:[UIImage imageNamed:@"checkbox_pressed"] forState:UIControlStateSelected];
    [agreeBtn addTarget:self action:@selector(ClickAgreeBtn) forControlEvents:UIControlEventTouchUpInside];
    agreeBtn.selected = YES;
    [self.view addSubview:agreeBtn];
    self.agreeBtn = agreeBtn;
    
    UIButton *protocolBtn = [[UIButton alloc] init];
    protocolBtn.frame = CGRectMake(CGRectGetMaxX(self.agreeBtn.frame), SubviewTopMarginY + FieldViewH*2 + 10, 140, 20);
    [protocolBtn setTitleColor:HEXCOLOR(0x5584d5) forState:UIControlStateNormal];
    [protocolBtn setTitle:@"《必得利服务协议》" forState:UIControlStateNormal];
    protocolBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [protocolBtn addTarget:self action:@selector(ClickProtocolBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:protocolBtn];
    self.protocolBtn = protocolBtn;
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.enabled = NO;
    nextButton.clipsToBounds = YES;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.agreeBtn.frame)+10, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(ClickNextStepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}

- (IBAction)ClickGetMsgCodeBtn {
    
    [self.view endEditing:YES];
}

- (void)GetMsgCode{
    self.msgCodeFieldView.button.second = 90;
    [self.msgCodeFieldView.button start];
}

- (IBAction)ClickAgreeBtn {
    self.agreeBtn.selected = !self.agreeBtn.selected;
    [self textFieldChange:nil];
    
}

- (IBAction)ClickProtocolBtn {
}

- (IBAction)ClickNextStepBtn {
    [self.view endEditing:YES];
    
    
    SetPasswordViewController *setPswVc = [[SetPasswordViewController alloc]init];
    setPswVc.rootPopVc = self.rootPopVc;
    setPswVc.phoneNumber = self.phoneNumFieldView.textField.text;
    [self.msgCodeFieldView.button stop];
    [self.navigationController pushViewController:setPswVc animated:YES];
}

- (void)textFieldChange:(UITextField *)textField
{
    if (self.phoneNumFieldView.textField.text.length == 11 && self.msgCodeFieldView.textField.text.length && self.agreeBtn.selected) {
        self.nextButton.enabled = YES;
    }else{
        self.nextButton.enabled = NO;
    }
    
    if (self.phoneNumFieldView.textField.text.length > 11) {
        self.phoneNumFieldView.textField.text = [self.phoneNumFieldView.textField.text substringToIndex:11];
    }
}
@end
