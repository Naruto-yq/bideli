//
//  SuccessSetLoginPsdViewController.m
//  app
//
//  Created by 余钦 on 16/5/3.
//
//

#import "SuccessSetLoginPsdViewController.h"
#import "LoginVC.h"
#import "UIBarButtonItem+NavleftBarButtonItem.h"

@interface SuccessSetLoginPsdViewController ()
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;

@end

@implementation SuccessSetLoginPsdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = MyLocalizedString(@"PasswordManager");
    
    self.LoginButton.clipsToBounds = YES;
    self.LoginButton.layer.cornerRadius = 6.0f;
    [self.LoginButton addTarget:self action:@selector(ClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    // 设置导航条的按钮
    UIBarButtonItem *backButton = [UIBarButtonItem barButtonItemWithImage:@"left_arrow" highImage:nil target:self action:@selector(clickBackBarButton)];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)clickBackBarButton {
    [self.navigationController popViewControllerAnimated:self.rootPopVc];
}

- (void)ClickLoginBtn{
    LoginVC *loginVc = [[LoginVC alloc] init];
    loginVc.rootPopVc = self.rootPopVc;
    [self.navigationController pushViewController:loginVc animated:YES];
}
@end
