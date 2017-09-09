//
//  UIBarButtonItem+NavleftBarButtonItem.h
//  cmbfaeApp
//
//  Created by 余钦 on 16/3/28.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (NavleftBarButtonItem)
+ (instancetype)barButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithImageUrl:(NSString *)iconUrl title:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action;
+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName target:(id)target action:(SEL)action;
@end
