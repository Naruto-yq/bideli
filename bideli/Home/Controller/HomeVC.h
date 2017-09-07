//
//  HomeVC.h
//  bideli
//
//  Created by 余钦 on 2017/8/28.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger, eHomeSectionName) {
    eHomeSectionName_Banner = 0,
    eHomeSectionName_Asset,
    eHomeSectionName_Interaction,
    eHomeSectionName_Brand,
    eHomeSectionName_end,
};

@interface HomeVC : BaseViewController

@end
