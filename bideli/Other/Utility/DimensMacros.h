//
//  DimensMacros.h
//  app
//
//  Created by 余钦 on 16/5/9.
//
//

#ifndef DimensMacros_h
#define DimensMacros_h

//状态栏高度

#define STATUS_BAR_HEIGHT 20

//NavBar高度

#define NAVIGATION_BAR_HEIGHT 44

//状态栏 ＋ 导航栏 高度

#define STATUS_AND_NAVIGATION_HEIGHT ((STATUS_BAR_HEIGHT) + (NAVIGATION_BAR_HEIGHT))

//屏幕 rect

#define SCREEN_RECT ([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)



#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT_64 ([UIScreen mainScreen].bounds.size.height - 64)
#define SCREEN_HEIGHT_64_49 ([UIScreen mainScreen].bounds.size.height - 64 - 49)

#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

//屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))

//view width height
#define ViewW(view) view.frame.size.width
#define ViewH(view) view.frame.size.height

//以iphone6的比例来计算宽高
#define isLessIPhone5s ([UIScreen mainScreen].bounds.size.height <= 568)
#define isThanIPhone6 ([UIScreen mainScreen].bounds.size.height >= 667)

#define rWidth(dx) ([UIScreen mainScreen].bounds.size.width/375.0f)*dx
#define rHeight(dy) ([UIScreen mainScreen].bounds.size.height/667.0f)*dy
//以iphone6的比例来计算字体大小
#define rFontSize(fsize) ([UIScreen mainScreen].bounds.size.width/375.0f)*fsize

#define isSystemVerLater8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define isSystemVerLater9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

//iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//iPhone6
#define iPhone6    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size) : NO)
//iPhone6+
#define iPhone6Plus  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) : NO)

#endif /* DimensMacros_h */
