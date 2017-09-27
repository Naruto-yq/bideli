//
//  UIFont+UsedFont.m
//  app
//
//  Created by 余钦 on 16/8/4.
//
//

#import "UIFont+UsedFont.h"

@implementation UIFont (UsedFont)
+ (UIFont *)systemFontOfSize:(CGFloat)fontSize {
    if ([UIFont fontWithName:fontName_PingFang size:fontSize] != nil) {
        return [UIFont fontWithName:fontName_PingFang size:fontSize];
    }else {
        return [UIFont systemFontOfSize:fontSize];
    }
}


+ (UIFont *)fontWithName:(NSString *)fontName ofSize:(CGFloat)fontSize {
    if ([UIFont fontWithName:fontName size:fontSize] != nil) {
        return [UIFont fontWithName:fontName size:fontSize];
    }else {
        return [UIFont systemFontOfSize:fontSize];
    }
}

@end
