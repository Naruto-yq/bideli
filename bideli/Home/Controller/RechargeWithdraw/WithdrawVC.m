//
//  WithdrawVC.m
//  app
//
//  Created by 余钦 on 2017/5/22.
//
//

#import "WithdrawVC.h"
#import "OneFieldView.h"
#import "BankCardSelectView.h"
#import "WithdrawResultVC.h"

@interface WithdrawVC ()<UITextFieldDelegate>
@property (nonatomic, weak)UILabel *limitRechargeLabel;
@property (nonatomic, weak) BankCardSelectView *bankCardSelectView;
@property (nonatomic, weak)OneFieldView *amountFieldView;
@property (nonatomic, weak)UILabel *balanceLabel;
@property (nonatomic, weak)UIButton *withdrawAllBtn;
@property (nonatomic, weak)UILabel *realtimeAmountLabel;
@property (nonatomic, weak)UIButton *confirmButtton;
@end

@implementation WithdrawVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"提现";
    
    [self setupSubviews];
}


- (void)setupSubviews {
    int nRowCount = 0;
    
    BankCardSelectView *bankCardSelectView = [[BankCardSelectView alloc] init];
    bankCardSelectView.frame = CGRectMake(0, SubviewTopMarginY, ViewW(self.view), FieldViewH+10);
    bankCardSelectView.bankName = [NSString stringWithFormat:@"%@(%@)", @"中国银行", @"4967"];
    [self.view addSubview:bankCardSelectView];
    self.bankCardSelectView = bankCardSelectView;
    
    nRowCount++;
    
    CGFloat limitRechargeLabelH = 30;
    UILabel *limitRechargeLabel = [UILabel new];
    limitRechargeLabel.frame = CGRectMake(IndicateLeftMargin, SubviewTopMarginY + FieldViewH*nRowCount+10, ViewW(self.view)-2*IndicateLeftMargin, limitRechargeLabelH);
    limitRechargeLabel.textColor = HEXCOLOR(0x999999);
    limitRechargeLabel.font = [UIFont systemFontOfSize:12];
    limitRechargeLabel.numberOfLines = 0;
    limitRechargeLabel.textAlignment = NSTextAlignmentLeft;
    limitRechargeLabel.text = [NSString stringWithFormat:@"单日10万以内实时到账, 10万以上下一个工作日到账"];
    [self.view addSubview:limitRechargeLabel];
    self.limitRechargeLabel = limitRechargeLabel;
    
    OneFieldView *amountFieldView = [[OneFieldView alloc] init];
    amountFieldView.borderStyle = ZZLCTextFieldBorderStyleNone;
    amountFieldView.frame = CGRectMake(0, SubviewTopMarginY + limitRechargeLabelH + FieldViewH*nRowCount+10, ViewW(self.view), FieldViewH+10);
    amountFieldView.labelText = @"金额";
    amountFieldView.adjustByLabel = YES;
    amountFieldView.textField.attributedPlaceholder = [NSMutableAttributedString getAttributedPlaceholder:@"请输入提现金额" fontSize:14];
    amountFieldView.textField.keyboardType = UIKeyboardTypeDecimalPad;
    [amountFieldView.textField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    amountFieldView.textField.delegate = self;
    [self.view addSubview:amountFieldView];
    self.amountFieldView = amountFieldView;
    
    CGFloat balanceViewH = 30;
    CGFloat withdrawAllBtnW = 50;
    UIView *balanceBgView = [UIView new];
    balanceBgView.backgroundColor = [UIColor whiteColor];
    balanceBgView.frame = CGRectMake(0, CGRectGetMaxY(self.amountFieldView.frame), ViewW(self.view), balanceViewH);
    [self.view addSubview:balanceBgView];
    
    UILabel *balanceLabel = [UILabel new];
    balanceLabel.frame = CGRectMake(IndicateLeftMargin, 0, ViewW(self.view)-2*IndicateLeftMargin-withdrawAllBtnW-10, balanceViewH);
    balanceLabel.font = [UIFont systemFontOfSize:12];
    balanceLabel.textAlignment = NSTextAlignmentLeft;
    NSString *balanceStr = [NSString stringWithFormat:@"账户余额(元):%@", @"50090.89"];
    balanceLabel.attributedText = [self ShowDifferentColorWithString:balanceStr];
    [balanceBgView addSubview:balanceLabel];
    self.balanceLabel = balanceLabel;
    
    UIButton *withdrawAllBtn = [[UIButton alloc] init];
    withdrawAllBtn.frame = CGRectMake(ViewW(self.view)-IndicateLeftMargin-withdrawAllBtnW, 0, withdrawAllBtnW, balanceViewH);
    [withdrawAllBtn setTitle:@"全部提现" forState:UIControlStateNormal];
    [withdrawAllBtn setTitleColor:ConfirmButtonNormalColor forState:UIControlStateNormal];
    withdrawAllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [withdrawAllBtn addTarget:self action:@selector(ClickWithdrawAllBtn) forControlEvents:UIControlEventTouchUpInside];
    [balanceBgView addSubview:withdrawAllBtn];
    self.withdrawAllBtn = withdrawAllBtn;
    
    UILabel *realtimeAmountLabel = [UILabel new];
    realtimeAmountLabel.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(balanceBgView.frame), ViewW(self.view)-2*IndicateLeftMargin, 30);
    realtimeAmountLabel.font = [UIFont systemFontOfSize:12];
    realtimeAmountLabel.textAlignment = NSTextAlignmentLeft;
    realtimeAmountLabel.textColor = HEXCOLOR(0x999999);
    realtimeAmountLabel.text = [NSString stringWithFormat:@"今日实时到账余额(元):%@", @"100000"];
    [self.view addSubview:realtimeAmountLabel];
    self.realtimeAmountLabel = realtimeAmountLabel;
    
    UIButton *confirmButtton = [[UIButton alloc] init];
    confirmButtton.enabled = NO;
    confirmButtton.clipsToBounds = YES;
    confirmButtton.layer.cornerRadius = 6.0f;
    confirmButtton.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(balanceBgView.frame) + CommonConfirmButtonH, ViewW(self.view)-2*IndicateRightMargin, CommonConfirmButtonH);
    [confirmButtton setTitle:@"确认提现" forState:UIControlStateNormal];
    [confirmButtton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonDisableColor] forState:UIControlStateDisabled];
    [confirmButtton setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [confirmButtton addTarget:self action:@selector(ClickConfirmWithdrawButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButtton];
    self.confirmButtton = confirmButtton;
}

- (void)ClickWithdrawAllBtn {
    self.amountFieldView.textField.text = @"50090.89";
    [self textFieldChange:nil];
}

- (void)ClickConfirmWithdrawButton {
//    if ([self.amountFieldView.textField.text doubleValue] == 0.00) {
//        [PublicTool ShowTipWithMsg:@"请输入正确的提现金额" addToView:self.view afterDelay:MBProgressHUDDelay];
//        return;
//    }
//    
//    if ([self.amountFieldView.textField.text doubleValue] > [self.depositAccountInfo.lastbalance doubleValue]) {
//        [PublicTool ShowTipWithMsg:@"提现金额超出可用限额" addToView:self.view afterDelay:MBProgressHUDDelay];
//        return;
//    }
//    
//    if ([self.amountFieldView.textField.text doubleValue] > [self.depositAccountInfo.rw_left doubleValue]) {
//          YQAlertView *alertView = [[YQAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"今日累计提现金额已大于%@元,此笔提现金额将下一个工作日24点前到账", self.depositAccountInfo.day_bigamt_limit]delegate:self buttonTitles:@"重新输入", @"继续提现", nil];
//          [alertView Show];
//        return;
//    }
    WithdrawResultVC *resultVc = [[WithdrawResultVC alloc] init];
    [self.navigationController pushViewController:resultVc animated:YES];
}

- (NSAttributedString *)ShowDifferentColorWithString:(NSString *)string
{
    NSUInteger stringLen = string.length;
    
    NSMutableAttributedString *attrStr = nil;
    
    NSString *title = @"账户余额(元):";
    
    if (stringLen) {
        attrStr = [[NSMutableAttributedString alloc]initWithString:string];
        [attrStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0xff632c) range:NSMakeRange(0, stringLen)];
        [attrStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x999999) range:NSMakeRange(0, title.length)];
    }
    
    return attrStr;
}
#pragma mark --- textfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField.text rangeOfString:@"."].location != NSNotFound) {
        if (([string compare:@"."] == NSOrderedSame)) {
            return NO;
        }
        
        NSRange dotRange = [textField.text rangeOfString:@"."];
        NSString *dotSubStr = [textField.text substringFromIndex:dotRange.location+1];
        
        if (dotSubStr.length >= 2 && !(range.location <= dotRange.location) && ([string compare:@""] != NSOrderedSame)) {
            return NO;
        }
    }
    return YES;
}

- (void)textFieldChange:(UITextField *)textField {

    if (self.amountFieldView.textField.text.length) {
        self.confirmButtton.enabled = YES;
    }else {
        self.confirmButtton.enabled = NO;
    }
}


#pragma mark --- YQAlertViewDelegate
//- (void)alertView:(YQAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    //do something
//    switch (buttonIndex) {
//        case 0:
//        {
//            
//        }
//            break;
//            
//        case 1:
//        {
//            [self.payPwdView setAmount:self.amountFieldView.textField.text];
//            [self.payPwdView setTitle:self.title];
//            [self.payPwdView showPWDView];
//        }
//            break;
//            
//        default:
//            break;
//    }
//}
@end
