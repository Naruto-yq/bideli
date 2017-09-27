//
//  InteractionCell.h
//  bideli
//
//  Created by 余钦 on 2017/8/29.
//  Copyright © 2017年   reserved.
//

#import "BaseTableViewCell.h"

#define CollectionViewItemH rHeight(80)
#define lineSpacing       2
#define InteractionCellH (CollectionViewItemH*3+2*lineSpacing)

@class InteractionCell;
@protocol InteractionCellDelegate <NSObject>
@optional
- (void)interactionCell:(InteractionCell *)cell DidSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface InteractionCell : BaseTableViewCell
@property (nonatomic, weak)id <InteractionCellDelegate>delegate;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong)NSArray *interactionArray;
@end
