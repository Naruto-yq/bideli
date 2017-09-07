//
//  UtilsMacros.h
//  cmbfaeApp
//
//  Created by 余钦 on 16/4/5.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

#define StringFile @"Localization(Chinese)"
#define ShowFlag  0

//Log utils marco
#ifdef DEBUG

#define ALog(format, ...) printf("[%s] %s [Line:%d] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

#else

#define ALog(...)

#endif

#ifdef DEBUG

#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

#define DLog(...)

#endif

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//十六进制颜色值
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 颜色定义
#define KC1_515151    HEXCOLOR(0x515151)     // 黑
#define KC2_999999    HEXCOLOR(0x999999)     // 灰
#define KC3_C6C5C7    HEXCOLOR(0xC6C5C7)     // 浅灰
#define KC4_F55848    HEXCOLOR(0xF55848)     // 浅红
#define kC5_E8E8E8    HEXCOLOR(0xE8E8E8)     //分隔线条颜色
#define kC6_F54949    HEXCOLOR(0xF54949)     //红色
#define kC7_FFBD50    HEXCOLOR(0xFFBD50)     //黄色
#define kC8_F8F8F8    HEXCOLOR(0xF8F8F8)     //背景颜色

//字体设置
#define kF0_30         [UIFont systemFontOfSize:30]
#define kF1_20         [UIFont systemFontOfSize:20]
#define kF2_17         [UIFont systemFontOfSize:17]
#define kF3_16         [UIFont systemFontOfSize:16]
#define kF4_15         [UIFont systemFontOfSize:15]
#define kF5_14         [UIFont systemFontOfSize:14]
#define kF6_13         [UIFont systemFontOfSize:13]
#define kF7_12         [UIFont systemFontOfSize:12]
#define kF8_11         [UIFont systemFontOfSize:11]
#define kF9_10         [UIFont systemFontOfSize:10]

#define kF5_14_Bold    [UIFont boldSystemFontOfSize:14]
#define kF4_15_Bold    [UIFont boldSystemFontOfSize:15]
#define kF3_16_Bold    [UIFont boldSystemFontOfSize:16]
#define kF2_17_Bold    [UIFont boldSystemFontOfSize:17]

//获取字符串
#define GetLocalizedStringByKey(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:StringFile]


//字体相关
#define FontWithSize(fontSize) [UIFont fontWithName:fontName_PingFang size:fontSize]

//UIApplication
#define APPD  [UIApplication sharedApplication]

#define INCREASE_COLOR HEXCOLOR(0xff602c)
#define DECREASE_COLOR HEXCOLOR(0x76ca74)

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//通知消息
#define  ZZLCQQShareEndNotification       @"ZZLCQQShareEndNotification"
#define  ZZLCWXShareEndNotification       @"ZZLCWXShareEndNotification"

#define  ZZLCAppWillEnterForegroundNotification     @"ZZLCApplicationWillEnterForeground"

#endif /* UtilsMacros_h */
