//
//  Macros.h
//  app
//
//  Created by 余钦 on 16/4/21.
//
//

#ifndef Macros_h
#define Macros_h

#define APPKEY_BaiDuMap @"TmXwfzot2GL0G1oS2OsfiIMGrvceA1Sh" //bundleId:com.liubo.hake
//#define APPKEY_BaiDuMap @"wia9R6nYimxncXMqc0WBqltG0ZmvUOps" //bundleId:com.yuqin.bideli

#import "UtilsMacros.h"

#import "APIStringMacros.h"

#import "PathMacros.h"

#import "DimensMacros.h"

#import "Share.h"


#define WeakSelf  __weak __typeof(self)wself  = self

#define PageSize  10

//public no dataview
#define noDataW  120
#define noDataH  (noDataW)
#define noDataX  (SCREEN_WIDTH - noDataW)/2.0f
#define noDataY  (SCREEN_HEIGHT - noDataH)/2.0f - noDataH


//text color && font
#define IndicateLabelTFontSize  14
#define IndicateFieldTFontSize  17
#define IndicateCountDownBtnFontSize  13
#define IndicateFieldPlaceholderFontSize  14
#define IndicateLabelTextColor     HEXCOLOR(0x000000)
#define IndicateFieldTextColor     HEXCOLOR(0x14212c)
#define IndicateFieldBgColor       HEXCOLOR(0xf4f4f4)
#define ConfirmButtonNormalColor   HEXCOLOR(0xfbd860)
#define ConfirmButtonDisableColor  HEXCOLOR(0xcccccc)
#define LineColor                  HEXCOLOR(0xeaeaea)

#define markFontSize  11.0f
#define fixedTitleFontSize 16.0f

//margin
#define SubviewTopMarginY      10
#define IndicateLeftMargin     16
#define IndicateRightMargin    16
#define IndicateControlMargin    10
#define ConfirmButtonTopMargin   60
#define CellMarginY    10

//control width && height
#define settingCellFontSize 15.0f
#define settingCellHeight   55
#define cellArrowW 20
#define IndicateLabelW 76
#define IndicateLabelH 20
#define IndicateFieldH 36
#define IndicateButtonW rWidth(92)
#define CommonConfirmButtonH 40
#define FieldViewH 55
#define IndicateViewLineH  0.5


#endif /* Macros_h */
