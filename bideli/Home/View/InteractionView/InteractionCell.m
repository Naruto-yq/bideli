//
//  InteractionCell.m
//  bideli
//
//  Created by 余钦 on 2017/8/29.
//  Copyright © 2017年   reserved.
//

#import "InteractionCell.h"
#import "InteractionCollectionViewCell.h"
#import "ItemInfo.h"

@interface InteractionCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, weak)UICollectionViewFlowLayout *flowLayout;
@end

@implementation InteractionCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"interactionCell";
    InteractionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[InteractionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HEXCOLOR(0xf5f5f5);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setupSubviews];
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-2*lineSpacing)/3, CollectionViewItemH);
    flowLayout.minimumLineSpacing = lineSpacing;
    flowLayout.minimumInteritemSpacing = lineSpacing;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout = flowLayout;
    
    if (self.collectionView) {
        [self.collectionView removeFromSuperview];
    }
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.contentView.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.pagingEnabled = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[InteractionCollectionViewCell class] forCellWithReuseIdentifier:ID];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
}


#pragma mark -- UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.interactionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InteractionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    ItemInfo *itemInfo = self.interactionArray[indexPath.row];
    cell.title = itemInfo.title;
    cell.icon = itemInfo.icon;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(interactionCell:DidSelectedAtIndexPath:)]) {
        [self.delegate interactionCell:self DidSelectedAtIndexPath:indexPath];
    }
}
@end
