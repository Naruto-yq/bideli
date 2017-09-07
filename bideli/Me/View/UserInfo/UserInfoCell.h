//
//  UserInfoCell.h
//  app
//
//  Created by 余钦 on 16/4/27.
//
//

#import <UIKit/UIKit.h>

@class UserInfo;

@interface UserInfoCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property(nonatomic, copy)NSString *title;

@property(nonatomic, strong)UserInfo *userInfo;

@property(nonatomic, strong)UIImage *icon;
@end
