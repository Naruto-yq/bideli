//
//  UIImage+ResizedImage.h
//  cmbfaeApp
//
//  Created by 余钦 on 16/3/29.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ResizedImage)
+ (UIImage *)resizedImageWithName:(NSString *)imageName;
//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color;
@end
