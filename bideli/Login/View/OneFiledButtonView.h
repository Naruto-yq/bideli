//
//  OneFiledButtonView.h
//  zzlc
//
//  Created by 余钦 on 2016/11/15.
//  Copyright © 2016年 CMB QIANHAI FINANCIAL ASSET EXCHANGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICountdownButton.h"

@interface OneFiledButtonView : UIView
@property (nonatomic, copy)NSString *labelText;
@property(nonatomic, weak)UILabel *label;
@property(nonatomic, weak)UITextField *textField;
@property (nonatomic, weak)UICountdownButton *button;
@property (nonatomic, assign)ZZLCTextFieldBorderStyle borderStyle;
@end
