 //
//  SetPasswordViewController.m
//  app
//
//  Created by 余钦 on 16/4/25.
//
//

#import "SetPasswordViewController.h"
#import "SuccessRegisterViewController.h"
#import "NSMutableAttributedString+CustomerAttributedString.h"

@interface SetPasswordViewController ()
@property (nonatomic, weak)OneFieldView *passwordFieldView;
@property (nonatomic, weak)OneFieldView *confirmPasswordFieldView;
@property (weak, nonatomic) UILabel *tipLabel;
@property (nonatomic, weak)UIButton *nextButton;
@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    [super viewWillDisappear:animated];
}

- (void)setupSubViews {
    OneFieldView *passwordFieldView = [[OneFieldView alloc] init];
    passwordFieldView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH);
    passwordFieldView.labelText = @"输入密码";
    passwordFieldView.textField.secureTextEntry = YES;
    passwordFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:MyLocalizedString(@"PasswordPlaceholder")];
    [passwordFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:passwordFieldView];
    self.passwordFieldView = passwordFieldView;
    
    OneFieldView *confirmPasswordFieldView = [[OneFieldView alloc] init];
    confirmPasswordFieldView.frame = CGRectMake(0, SubviewTopMarginY + FieldViewH, ViewW(self.view), FieldViewH);
    confirmPasswordFieldView.labelText = @"确认密码";
    confirmPasswordFieldView.textField.secureTextEntry = YES;
    confirmPasswordFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:MyLocalizedString(@"PasswordPlaceholder")];
    [confirmPasswordFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:confirmPasswordFieldView];
    self.confirmPasswordFieldView = confirmPasswordFieldView;
    
    UILabel *tipLabel = [UILabel new];
    tipLabel.frame = CGRectMake(IndicateLeftMargin, SubviewTopMarginY + FieldViewH*2, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    tipLabel.textColor = [UIColor redColor];
    tipLabel.font = [UIFont systemFontOfSize:12];
    tipLabel.textAlignment = NSTextAlignmentLeft;
    tipLabel.hidden = YES;
    tipLabel.numberOfLines = 0;
    tipLabel.adjustsFontSizeToFitWidth = YES;
    [self.view addSubview:tipLabel];
    self.tipLabel = tipLabel;
    
    UIButton *nextButton = [[UIButton alloc] init];
    nextButton.enabled = NO;
    nextButton.clipsToBounds = YES;
    nextButton.layer.cornerRadius = 6.0f;
    nextButton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(self.tipLabel.frame), ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [nextButton setTitle:@"确认" forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [nextButton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(ClickComfirmBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    self.nextButton = nextButton;
}


- (IBAction)ClickComfirmBtn {
    if ([self.passwordFieldView.textField.text compare:self.confirmPasswordFieldView.textField.text] != NSOrderedSame) {
        return;
    }
    
    [self.view endEditing:YES];
    SuccessRegisterViewController *successVc = [[SuccessRegisterViewController alloc] init];
    successVc.rootPopVc = self.rootPopVc;
    [self.navigationController pushViewController:successVc animated:YES];
}


- (void)textFieldChange:(UITextField *)textField
{
    self.tipLabel.hidden = YES;
    
    if ((self.passwordFieldView.textField.text.length >= 6 && self.passwordFieldView.textField.text.length <= 16)
        && (self.confirmPasswordFieldView.textField.text.length >= 6 && self.confirmPasswordFieldView.textField.text.length <= 16)) {
        
    }else{
        self.nextButton.enabled = NO;
    }
    
    if (textField.text.length > 16) {
        textField.text = [textField.text substringToIndex:16];
        self.tipLabel.hidden = NO;
        self.tipLabel.text = MyLocalizedString(@"PasswordTip3");
    }
    
    if (self.passwordFieldView.textField.text.length >= 6) {
        if (textField == self.confirmPasswordFieldView.textField && ![self checkPassword:self.passwordFieldView.textField.text]){
            textField.text = [textField.text substringToIndex:0];
            self.tipLabel.hidden = NO;
            self.tipLabel.text = MyLocalizedString(@"PasswordTip2");
        }
    }else{
        if (textField == self.confirmPasswordFieldView.textField) {
            textField.text = [textField.text substringToIndex:0];
            self.tipLabel.hidden = NO;
            self.tipLabel.text = MyLocalizedString(@"PasswordTip1");
        }

    }
    
    if (self.passwordFieldView.textField.text.length == self.confirmPasswordFieldView.textField.text.length) {
        if (![self.passwordFieldView.textField.text isEqualToString:self.confirmPasswordFieldView.textField.text]) {
            self.tipLabel.hidden = NO;
            self.tipLabel.text = MyLocalizedString(@"PasswordTip4");
        }else{
            self.nextButton.enabled = YES;
        }
    }
    
    if (self.confirmPasswordFieldView.textField.text.length > self.passwordFieldView.textField.text.length) {
        self.tipLabel.hidden = NO;
        self.nextButton.enabled = NO;
        self.tipLabel.text = MyLocalizedString(@"PasswordTip4");
    }
    
    if (self.confirmPasswordFieldView.textField.text.length < self.passwordFieldView.textField.text.length) {
        self.nextButton.enabled = NO;
    }
}

- (BOOL)checkPassword:(NSString *)passwordStr {
    NSString * regex = @"^(?!([a-zA-Z]+|\\d+)$)[a-zA-Z\\d]{6,16}$";
    //正则表达式
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    //Cocoa框架中的NSPredicate用于查询，原理和用法都类似于SQL中的where，作用相当于数据库的过滤取
    BOOL isMatch = [pred evaluateWithObject:passwordStr];
    //判读userNameField的值是否吻合
    return isMatch;
}
@end
