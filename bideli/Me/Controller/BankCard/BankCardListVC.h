//
//  BankCardListVC.h
//  app
//
//  Created by 余钦 on 2017/5/17.
//
//

#import "BaseViewController.h"
@class BankCardInfo;
@protocol BankCardListVcDelegate <NSObject>
@optional
- (void)bankCardListVcSeletedBankCard:(BankCardInfo *)bankcardInfo;
@end

@interface BankCardListVC : BaseViewController
@property (nonatomic, weak) id <BankCardListVcDelegate>delegate;
@end
