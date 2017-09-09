//
//  ResultDetailVC.h
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "BaseViewController.h"
@class SharerInfo;
@interface ResultDetailVC : BaseViewController
@property (nonatomic, copy)NSString *money;
@property (nonatomic, strong) SharerInfo *sharerInfo;
@end
