//
//  UIFont+UsedFont.h
//  app
//
//  Created by 余钦 on 16/8/4.
//
//

#import <UIKit/UIKit.h>

static NSString *fontName_PingFang = @"PingFangSC-Regular";
static NSString *fontName_PingFangRegular = @"PingFangSC-Regular";
static NSString *fontName_PingFangMedium = @"PingFangSC-Medium";
static NSString *fontName_RobotoRegular = @"Roboto";

@interface UIFont (UsedFont)
+ (UIFont *)defaultFontofSize:(CGFloat)fontSize;
+ (UIFont *)fontWithName:(NSString *)fontName ofSize:(CGFloat)fontSize;
@end
