//
//  BusinessPaoPaoView.m
//  bideli
//
//  Created by Yanglijuan on 2017/9/9.
//  Copyright © 2017年   reserved.
//

#import "BusinessPaoPaoView.h"
#import "ShopDetailViewController.h"
#import "UIViewController+GetCurrentViewController.h"
#import "MapPointModel.h"

@interface BusinessPaoPaoView()
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *signLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@end

@implementation BusinessPaoPaoView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.cancelButton.layer.borderWidth = 1.0;
    self.cancelButton.layer.borderColor = kC5_E8E8E8.CGColor;
    self.sureButton.layer.borderWidth = 1.0;
    self.sureButton.layer.borderColor = kC5_E8E8E8.CGColor;
}

+ (instancetype)createWithNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (IBAction)cancelButtonAction:(UIButton *)sender {
    UIViewController *currentCtl = [UIViewController getCurrentViewController];
//    [currentCtl sendevent]
    [currentCtl remoteControlReceivedWithEvent:UIEventTypeTouches];
}

- (IBAction)sureButtonAction:(UIButton *)sender {
    ShopDetailViewController *shopVC = [[ShopDetailViewController alloc] init];
    shopVC.shopTitle = self.pointModel.name;
    UIViewController *currentCtl = [UIViewController getCurrentViewController];
    [currentCtl.navigationController pushViewController:shopVC animated:YES];
}

@end
