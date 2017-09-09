//
//  NSMutableAttributedString+CustomerAttributedString.m
//  app
//
//  Created by 余钦 on 16/5/16.
//
//

#import "NSMutableAttributedString+CustomerAttributedString.h"

@implementation NSMutableAttributedString (CustomerAttributedString)
+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string {
    NSMutableAttributedString *placeholderStr = [[NSMutableAttributedString alloc] initWithString:string];
    CGFloat fontSize = 12;
    CGFloat offset = -1.5;
    [placeholderStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, string.length)];
    [placeholderStr addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:NSMakeRange(0, string.length)];
    return placeholderStr;
}

+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *placeholderStr = [[NSMutableAttributedString alloc] initWithString:string];
    CGFloat offset = -1;
    [placeholderStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, string.length)];
    [placeholderStr addAttribute:NSBaselineOffsetAttributeName value:@(offset) range:NSMakeRange(0, string.length)];
    return placeholderStr;
}

+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string color:(UIColor *)color fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *placeholderStr = [[NSMutableAttributedString alloc] initWithString:string];
    [placeholderStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, string.length)];
    if (color) {
        [placeholderStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    }
    [placeholderStr addAttribute:NSBaselineOffsetAttributeName value:@(-1) range:NSMakeRange(0, string.length)];
    return placeholderStr;
}

+ (NSMutableAttributedString *)getAttributedPlaceholder:(NSString *)string color:(UIColor *)color fontSize:(CGFloat)fontSize offsetY:(CGFloat)offsetY {
    NSMutableAttributedString *placeholderStr = [[NSMutableAttributedString alloc] initWithString:string];
    [placeholderStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, string.length)];
    if (color) {
        [placeholderStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    }
    [placeholderStr addAttribute:NSBaselineOffsetAttributeName value:@(offsetY) range:NSMakeRange(0, string.length)];
    return placeholderStr;
}
@end
