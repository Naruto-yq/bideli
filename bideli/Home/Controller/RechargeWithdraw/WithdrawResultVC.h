//
//  WithdrawResultVC.h
//  app
//
//  Created by 余钦 on 2017/5/25.
//
//

#import "BaseViewController.h"

@interface WithdrawResultVC : BaseViewController
@property (nonatomic, assign)BOOL bBeyondDayLimitAmount;
@property (nonatomic, copy)NSString *bankName;
@property (nonatomic, copy)NSString *bankCardNum;
@end
