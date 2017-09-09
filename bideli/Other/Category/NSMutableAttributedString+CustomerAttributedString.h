//
//  NSMutableAttributedString+CustomerAttributedString.h
//  app
//
//  Created by 余钦 on 16/5/16.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (CustomerAttributedString)
+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string;
+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string fontSize:(CGFloat)fontSize;
+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string color:(UIColor *)color fontSize:(CGFloat)fontSize;
+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string color:(UIColor *)color fontSize:(CGFloat)fontSize offsetY:(CGFloat)offsetY;
@end
