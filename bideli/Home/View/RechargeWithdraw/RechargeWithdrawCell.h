//
//  RechargeWithdrawCell.h
//  bideli
//
//  Created by 杨丽娟 on 17/9/26.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface RechargeWithdrawCell : BaseTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, copy)NSString *title;
@end
