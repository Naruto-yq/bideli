//
//  CheckMsgCodeViewController.m
//  app
//
//  Created by 余钦 on 16/6/3.
//
//

#import "CheckMsgCodeViewController.h"
#import "SetNewLoginPswViewController.h"

@interface CheckMsgCodeViewController ()
@property (nonatomic, weak)OneFiledButtonView *msgCodeFieldView;
@property (nonatomic, weak)UIButton *nextButton;
@end

@implementation CheckMsgCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"设置登录密码";
    
    [self setupSubviews];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.msgCodeFieldView.button stop];
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
}

- (void)setupSubviews {
    UILabel *phoneNumInfoLabel = [UILabel new];
    phoneNumInfoLabel.frame = CGRectMake(IndicateLeftMargin, SubviewTopMarginY, ViewW(self.view)-2*IndicateLeftMargin, 56);
    phoneNumInfoLabel.textColor = HEXCOLOR(0x999999);
    phoneNumInfoLabel.font = [UIFont systemFontOfSize:14];
    phoneNumInfoLabel.numberOfLines = 0;
    [self.view addSubview:phoneNumInfoLabel];

    NSString *phoneNumber = [self.phoneNum stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    NSString *tipStr = [NSString stringWithFormat:MyLocalizedString(@"To your account safe,please verify msg code, msg code will send you phone %@"), phoneNumber];
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:tipStr];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:4];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [tipStr length])];
    
    phoneNumInfoLabel.attributedText = attributedString1;
    
    OneFiledButtonView *msgCodeFieldView = [[OneFiledButtonView alloc] init];
    msgCodeFieldView.frame = CGRectMake(0, CGRectGetMaxY(phoneNumInfoLabel.frame) + 10, ViewW(self.view), FieldViewH);
    msgCodeFieldView.textField.keyboardType = UIKeyboardTypeNumberPad;
    msgCodeFieldView.labelText = @"验证码";
    msgCodeFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入验证码"];
    [msgCodeFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [msgCodeFieldView.button addTarget:self action:@selector(ClickCountdownBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:msgCodeFieldView];
    self.msgCodeFieldView = msgCodeFieldView;
    
    self.msgCodeFieldView.button.second = 90;
    [self.msgCodeFieldView.button start];
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.enabled = NO;
    nextButton.clipsToBounds = YES;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.msgCodeFieldView.frame)+30, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(ClickNextstepBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}

- (IBAction)ClickCountdownBtn {
    self.msgCodeFieldView.button.second = 90;
    [self.msgCodeFieldView.button start];
}

- (void)ClickNextstepBtn {
    [self.view endEditing:YES];
    SetNewLoginPswViewController *setNewPswVc = [[SetNewLoginPswViewController alloc] init];
    setNewPswVc.rootPopVc = self.rootPopVc;
    setNewPswVc.phoneNum = self.phoneNum;
    setNewPswVc.msgCode = self.msgCodeFieldView.textField.text;
    [self.msgCodeFieldView.button stop];
    [self.navigationController pushViewController:setNewPswVc animated:YES];
}

- (void)textFieldChange:(UITextField *)textField{
    if (self.msgCodeFieldView.textField.text.length) {
        self.nextButton.enabled = YES;
    }else {
        self.nextButton.enabled = NO;
    }
}
@end
