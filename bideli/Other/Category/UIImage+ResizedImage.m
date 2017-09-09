//
//  UIImage+ResizedImage.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/3/29.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "UIImage+ResizedImage.h"

@implementation UIImage (ResizedImage)

+ (UIImage *)resizedImageWithName:(NSString *)imageName
{
    UIImage *image = [self imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
