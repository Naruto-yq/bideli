//
//  LoginVC.m
//  bideli
//
//  Created by 余钦 on 2017/9/27.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "LoginVC.h"
#import "LoginFieldView.h"
#import "RegisterCustomerButton.h"
#import "RegisteViewController.h"
#import "QJMainTabBarController.h"
#import "InputPhoneNoViewController.h"

#define TopMarginH 10
#define CtrolMarginH 10
#define MarginW 32

#define nameFontSize 16
#define textFieldFontSize 16

#define registerFontSzie 14

@interface LoginVC ()
@property(nonatomic, weak)LoginFieldView *phoneNumView;
@property(nonatomic, weak)LoginFieldView *pswField;
@property(nonatomic, weak)UIButton *loginButton;
@property(nonatomic, weak)RegisterCustomerButton *registerButton;
@property(nonatomic, weak)UIButton *forgetPswButton;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavTitleView];
    [self setupSubviews];
}

- (void)setupNavTitleView
{
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = UIBaselineAdjustmentAlignCenters;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.text = @"必得利登录";
    titleLabel.textColor = [UIColor blackColor];
    CGSize titleSize = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    titleLabel.frame = (CGRect){CGPointZero, titleSize};
    self.navigationItem.titleView = titleLabel;
}

- (void)setupSubviews {
    LoginFieldView *phoneNumView = [[LoginFieldView alloc] init];
    phoneNumView.frame = CGRectMake(MarginW, 0, ViewW(self.view)-2*MarginW, 66);
    phoneNumView.textField.keyboardType = UIKeyboardTypePhonePad;
    phoneNumView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入您的手机号" color:HEXCOLOR(0x888888) fontSize:rFontSize(textFieldFontSize)];
    UIView *customView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.3)];
    customView.backgroundColor = HEXCOLOR(0x888888);
    phoneNumView.textField.inputAccessoryView = customView;
    [phoneNumView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:phoneNumView];
    self.phoneNumView = phoneNumView;
    if (isExistsFile(aPathLatestPhoneNo)) {
        NSString *phoneNo = GetLatestPhone();
        self.phoneNumView.textField.text = phoneNo;
    }
    
    LoginFieldView *pswField = [[LoginFieldView alloc] init];
    pswField.frame = CGRectMake(MarginW, CGRectGetMaxY(phoneNumView.frame), ViewW(self.view)-2*MarginW, 66);
    pswField.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入您的登录密码" color:HEXCOLOR(0x888888) fontSize:rFontSize(textFieldFontSize)];
    pswField.textField.secureTextEntry = YES;
    [pswField.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:pswField];
    self.pswField = pswField;
    
    WeakSelf;

    UIButton *loginButton = [[UIButton alloc]init];
    //loginButton.backgroundColor = HEXCOLOR(0x5584d5);
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 4.0f;
    loginButton.enabled = NO;
    [loginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0xcccccc)] forState:UIControlStateDisabled];
    [loginButton setBackgroundImage:[UIImage imageWithColor:HEXCOLOR(0x5584d5)] forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(ClickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:loginButton];
    self.loginButton = loginButton;
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.pswField.mas_bottom).offset(40);
        make.left.right.mas_equalTo(wself.pswField);
        make.height.mas_equalTo(rHeight(40));
    }];
    
    UIButton *forgetPswButton = [[UIButton alloc]init];
    [forgetPswButton setTitleColor:HEXCOLOR(0x888888) forState:UIControlStateNormal];
    [forgetPswButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetPswButton addTarget:self action:@selector(ClickForgetPswButton) forControlEvents:UIControlEventTouchUpInside];
    forgetPswButton.titleLabel.font = [UIFont systemFontOfSize:registerFontSzie];
    forgetPswButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:forgetPswButton];
    self.forgetPswButton = forgetPswButton;
    [self.forgetPswButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wself.loginButton.mas_bottom).offset(rHeight(14));
        make.height.mas_equalTo(rHeight(18));
        make.right.mas_equalTo(wself.loginButton.mas_right);
    }];
    
    NSString *registerTitle = @"没有账号？现在注册";
    NSMutableAttributedString *registerAttrTitle = [[NSMutableAttributedString alloc] initWithString:registerTitle];
    [registerAttrTitle addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x888888) range:NSMakeRange(0, registerTitle.length)];
    [registerAttrTitle addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x5584d5) range:NSMakeRange(5, 4)];
    [registerAttrTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:registerFontSzie] range:NSMakeRange(0, registerTitle.length)];
    CGSize tittleSize = [registerAttrTitle boundingRectWithSize:CGSizeMake(ViewW(self.view), 30) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    CGFloat buttonH = 30.0f;
    CGFloat buttonW = ceilf(tittleSize.width) + 10;
    CGFloat viewHeight = ViewH(self.view)-30-rHeight(40);
    CGFloat buttonY = iPhone5 ? (viewHeight - buttonH - 30) : (viewHeight - buttonH - rHeight(50));
    RegisterCustomerButton *registerButton = [[RegisterCustomerButton alloc]init];
    registerButton.frame = CGRectMake((ViewW(self.view) - buttonW)/2, buttonY, buttonW, buttonH);
    [registerButton setAttributedTitle:registerAttrTitle forState:UIControlStateNormal];
    [registerButton setTitle:MyLocalizedString(@"RegisterNow") forState:UIControlStateNormal];
    [registerButton addTarget:self action:@selector(ClickRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:registerFontSzie];
    registerButton.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:registerButton];
    self.registerButton = registerButton;
}

- (void)ClickLoginButton:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (self.phoneNumView.textField.text.length == 11 &&[self.pswField.textField.text isEqualToString:@"111111"]) {
        [GLobalLocalData setLoginState:@"1"];
        [UIApplication sharedApplication].keyWindow.rootViewController = [[QJMainTabBarController alloc] init];
    }
    
}


- (void)ClickRegisterButton
{
    [self.view endEditing:YES];
    RegisteViewController *registeVc = [[RegisteViewController alloc]init];
    registeVc.rootPopVc = self.rootPopVc;
    [self.navigationController pushViewController:registeVc animated:YES];
    
}

- (void)ClickForgetPswButton
{
    [self.view endEditing:YES];
    InputPhoneNoViewController *inputPhoneNoVc = [[InputPhoneNoViewController alloc] init];
    inputPhoneNoVc.rootPopVc = self;
    [self.navigationController pushViewController:inputPhoneNoVc animated:YES];
}
#pragma mark ---- textField delegate
- (void)textFieldChange:(UITextField *)textField {
    if (self.phoneNumView.textField.text.length && self.pswField.textField.text.length) {
        self.loginButton.enabled = YES;
    }else {
        self.loginButton.enabled = NO;
    }
    
    if (self.phoneNumView.textField.text.length > 11) {
        self.phoneNumView.textField.text = [self.phoneNumView.textField.text substringToIndex:11];
    }
}
@end
