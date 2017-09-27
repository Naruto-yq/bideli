//
//  WithdrawResultVC.m
//  app
//
//  Created by 余钦 on 2017/5/25.
//
//

#import "WithdrawResultVC.h"

@interface WithdrawResultVC ()

@end

@implementation WithdrawResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"结果详情";
    
    [self SetupSubviews];
}

- (void)SetupSubviews {
    CGFloat successImageViewW = 58;
    UIImage *image = [UIImage imageNamed:@"recharge_success"];
    UIImageView *withdrawFinishImageView = [[UIImageView alloc] initWithImage:image];
    withdrawFinishImageView.frame = CGRectMake((ViewW(self.view) - successImageViewW)/2, rHeight(120), successImageViewW, successImageViewW);
    [self.view addSubview:withdrawFinishImageView];
    
    UILabel *withdrawFinishLabel = [[UILabel alloc] init];
    withdrawFinishLabel.text = @"恭喜您，提现成功！";
    [withdrawFinishLabel setFont:[UIFont systemFontOfSize:18.0]];
    [withdrawFinishLabel setTextColor:HEXCOLOR(0x3a5ba8)];
    withdrawFinishLabel.frame = CGRectMake(0, CGRectGetMaxY(withdrawFinishImageView.frame)+20, ViewW(self.view), 30);
    withdrawFinishLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:withdrawFinishLabel];
    
    UILabel *withdrawTipsLabel = [[UILabel alloc] init];
    withdrawTipsLabel.hidden = YES;
    withdrawTipsLabel.font = [UIFont systemFontOfSize:12.0];
    withdrawTipsLabel.textColor = HEXCOLOR(0x868686);
    withdrawTipsLabel.frame = CGRectMake(0, CGRectGetMaxY(withdrawFinishLabel.frame)+20, ViewW(self.view), 40);
    withdrawTipsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:withdrawTipsLabel];
    
    UIButton *withdrawFinishBtn = [[UIButton alloc] init];
    withdrawFinishBtn.frame = CGRectMake(IndicateLeftMargin, CGRectGetMaxY(withdrawTipsLabel.frame)+CommonConfirmButtonH, ViewW(self.view)-2*IndicateLeftMargin, CommonConfirmButtonH);
    [withdrawFinishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [withdrawFinishBtn.layer setCornerRadius:4.0f];
    [withdrawFinishBtn.layer setMasksToBounds:YES];
    [withdrawFinishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [withdrawFinishBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0]];
    [withdrawFinishBtn addTarget:self action:@selector(CickwithdrawFinishBtn) forControlEvents:UIControlEventTouchUpInside];
    [withdrawFinishBtn setBackgroundImage:[UIImage imageWithColor:ConfirmButtonNormalColor] forState:UIControlStateNormal];
    [self.view addSubview:withdrawFinishBtn];
    
    if (self.bBeyondDayLimitAmount) {
        withdrawFinishLabel.text = @"恭喜您，提现申请成功！";
        withdrawTipsLabel.hidden = NO;
        withdrawTipsLabel.text = [NSString stringWithFormat:@"提示：下一个工作日24点前自动转入至您的%@卡(%@)", self.bankName, [self.bankCardNum substringWithRange:NSMakeRange(self.bankCardNum.length - 4, 4)]];
    }
}

- (void)CickwithdrawFinishBtn {
    [self.view endEditing:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
