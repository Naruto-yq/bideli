//
//  ChoseSharerCell.h
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "BaseTableViewCell.h"
@class SharerInfo;

@interface ChoseSharerCell : BaseTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)SharerInfo *shareInfo;
@property (nonatomic, copy)NSString *money;
@end
