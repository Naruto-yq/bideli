//
//  BankCardListCell.h
//  app
//
//  Created by 余钦 on 2017/5/17.
//
//

#import <UIKit/UIKit.h>

#define BankCardMarginX 20
#define BankCardMarginY 10
#define BankCardListCellH   (((SCREEN_WIDTH-2*BankCardMarginX)*200/640)+BankCardMarginY)
@class BankCardInfo;

@interface BankCardListCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)BankCardInfo *bankCardInfo;
@property (nonatomic, assign)BOOL isEmpty;

@end
