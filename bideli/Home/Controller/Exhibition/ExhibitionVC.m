//
//  ExhibitionVC.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/26.
//  Copyright © 2017年 bideli. All rights reserved.  test git for two
//

#import "ExhibitionVC.h"
#import "ExhibitionCell.h"

#define lineSpacing 10

@interface ExhibitionVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, weak)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic, strong)NSArray *imageArr;
@property(nonatomic, strong)NSArray *desTextArr;
@end

@implementation ExhibitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArr = @[@"hupo1.JPG", @"hupo2.JPG", @"hupo3.JPG", @"hupo4.JPG"];
    self.desTextArr = @[@"A套餐产品", @"B套餐产品", @"C套餐产品", @"D套餐产品"];

    [self setupSubviews];
}

- (void)setupSubviews {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-3*lineSpacing)/2, (SCREEN_WIDTH-3*lineSpacing)/2);
    flowLayout.minimumLineSpacing = lineSpacing;
    flowLayout.minimumInteritemSpacing = lineSpacing;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout = flowLayout;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(lineSpacing, lineSpacing, SCREEN_WIDTH-2*lineSpacing, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.pagingEnabled = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[ExhibitionCell class] forCellWithReuseIdentifier:ID];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

#pragma mark -- UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ExhibitionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.imageArr[indexPath.row];
    cell.title = self.desTextArr[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}
@end
