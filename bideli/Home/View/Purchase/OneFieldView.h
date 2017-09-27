//
//  OneFieldView.h
//  zzlc
//
//  Created by 余钦 on 16/11/7.
//  Copyright © 2016年 CMB QIANHAI FINANCIAL ASSET EXCHANGE. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZZLCTextFieldBorderStyle) {
    ZZLCTextFieldBorderStyleNone,
    ZZLCTextFieldBorderStyleRoundedRect
};

@interface OneFieldView : UIView
@property (nonatomic, copy)NSString *labelText;
@property (nonatomic, copy)NSString *unitText;
@property(nonatomic, weak)UILabel *label;
@property(nonatomic, weak)UITextField *textField;
@property (nonatomic, assign)ZZLCTextFieldBorderStyle borderStyle;
@property (nonatomic, assign)BOOL adjustByLabel;

@end
