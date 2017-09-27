//
//  AssetCell.h
//  bideli
//
//  Created by 杨丽娟 on 17/8/29.
//  Copyright © 2017年   reserved.
//

#import "BaseTableViewCell.h"


@protocol AssetViewdelegate <NSObject>

@optional
- (void)assetViewdelegateClickAssetButtonWithState:(BOOL)buttonState;
@end

@interface AssetCell : BaseTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, weak)id<AssetViewdelegate> delegate;
@end
