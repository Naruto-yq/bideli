//
//  UIBarButtonItem+NavleftBarButtonItem.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/3/28.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "UIBarButtonItem+NavleftBarButtonItem.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIButton+WebCache.h>

@implementation UIBarButtonItem (NavleftBarButtonItem)
+ (instancetype)barButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 50, 18);//左右barbutton大小一致
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -32, 0, 0);
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)barButtonItemWithImageUrl:(NSString *)iconUrl title:(NSString *)title target:(id)target action:(SEL)action
{
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(100, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:titleAttr context:nil].size;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if ((ceilf(titleSize.width)+4) > 50) {
        button.bounds = CGRectMake(0, 0, (ceilf(titleSize.width)+10), 18);//左右barbutton大小一致
    }else {
        button.bounds = CGRectMake(0, 0, 50, 18);//左右barbutton大小一致
    }
    button.imageView.contentMode = UIViewContentModeScaleToFill;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    
    if (iconUrl.length) {
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 32, 0, 0);
        [button sd_setImageWithURL:[NSURL URLWithString:iconUrl] forState:UIControlStateNormal];
    }else {
        [button setTitle:title forState:UIControlStateNormal];
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 60, 30);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName highImage:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 20);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 80, 0, 0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (instancetype)rightbarButtonItemWithImage:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 100, 30);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.adjustsImageWhenHighlighted = NO;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
