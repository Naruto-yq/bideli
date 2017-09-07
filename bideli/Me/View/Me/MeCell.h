//
//  MeCell.h
//  app
//
//  Created by 余钦 on 16/4/27.
//
//

#import <UIKit/UIKit.h>

@class UserInfo;

@interface MeCell : UITableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, copy)NSString *iconName;
@property(nonatomic, copy)NSString *title;
//Data---
@property(nonatomic, strong)UserInfo *userInfo;
@property(nonatomic, assign)NSUInteger bankCardCount;

@property(nonatomic, weak)UIView *redTipView;
@end
