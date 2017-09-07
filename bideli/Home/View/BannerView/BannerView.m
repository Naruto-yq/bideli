//
//  BannerView.m
//  cmbfaeApp
//
//  Created by 余钦 on 16/4/6.
//  Copyright © 2016年 cmbfae Co.,Ltd. All rights reserved.
//

#import "BannerView.h"
#import "BannerViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface BannerView () <UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, weak)UICollectionView *collectionView;
@property(nonatomic, weak)UICollectionViewFlowLayout *flowLayout;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, assign)NSInteger totalItemsCount;
@property(nonatomic, weak)UIPageControl *pageControl;
@end

@implementation BannerView
//+ (instancetype)bannerViewWithFrame:(CGRect)frame imagePathArray:(NSArray *)imagePathArray
//{
//    BannerView *bannerView = [[self alloc]initWithFrame:frame];
//    bannerView.imagePathArray = imagePathArray;
//    return bannerView;
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        _autoScrollTimeInterval = 0;
        [self SetupSubviews];
    }
    
    return self;
}

- (void)SetupSubviews
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = self.frame.size;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout = flowLayout;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.frame
                                                     collectionViewLayout:flowLayout];
    
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    [collectionView registerClass:[BannerViewCell class] forCellWithReuseIdentifier:ID];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self addSubview:collectionView];
    self.collectionView = collectionView;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.hidden = YES;
    pageControl.currentPageIndicatorTintColor = HEXCOLOR(0x5584d5);
    pageControl.pageIndicatorTintColor = HEXCOLOR(0xcccccc);
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.flowLayout.itemSize = self.frame.size;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak __typeof(&*self)weakSelf = self;
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-2);
        make.width.mas_equalTo(weakSelf.bounds.size.width/5.0);
        make.height.mas_equalTo(20);
    }];
    
    _collectionView.frame = self.bounds;
    if (self.imagePathArray) {
        if (_collectionView.contentOffset.x == 0) {
            [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_totalItemsCount*0.5 inSection:0]
                                    atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
    }
}

- (void)setImagePathArray:(NSArray *)imagePathArray
{
    [self stopScrollBanner];
    _imagePathArray = imagePathArray;
    if (imagePathArray.count > 1) {
        self.collectionView.scrollEnabled = YES;
        self.pageControl.hidden = NO;
        self.pageControl.numberOfPages = imagePathArray.count;
    }else{
        self.collectionView.scrollEnabled = NO;
        self.pageControl.hidden = YES;
    }
    _totalItemsCount = imagePathArray.count*1000;
    if (_imagePathArray) {
        if (self.imagePathArray.count > 1) {
            [self startScrollBanner];
        }
    }
    [self.collectionView reloadData];
}

- (void)startScrollBanner {
    if (_timer == nil) {
        _timer = [NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopScrollBanner {
    [_timer invalidate];
    _timer = nil;
}

- (void)automaticScroll
{
    int currentIndex = _collectionView.contentOffset.x / _flowLayout.itemSize.width;
    int targetIndex = currentIndex + 1;
    if (targetIndex == _totalItemsCount) {
        targetIndex = _totalItemsCount*0.5;
    }
    
    if (self.imagePathArray.count > 1) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:targetIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    }
}

#pragma mark -- UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_totalItemsCount == 0) {
        return 1;
    }else{
        return _totalItemsCount;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BannerViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    if (self.imagePathArray.count) {
        long itemIndex = indexPath.item % self.imagePathArray.count;
        NSString *imageUrl = self.imagePathArray[itemIndex];
        NSString *cacheImageKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:imageUrl]];
        UIImage *cacheImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:cacheImageKey];
        if (cacheImage) {
            cell.imageView.image = cacheImage;
        }else {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:self.imageName]];
        }
    }else{
        cell.imageView.image = [UIImage imageNamed:self.imageName];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.imagePathArray) {
        long nIndex = indexPath.item%self.imagePathArray.count;
        
        if ([self.delegate respondsToSelector:@selector(bannerView:didSelectedAtIndex:)]) {
            [self.delegate bannerView:self didSelectedAtIndex:nIndex];
        }
    }
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int currentIndex = _collectionView.contentOffset.x / _flowLayout.itemSize.width;
    if (self.imagePathArray.count) {
        NSInteger page = currentIndex%self.imagePathArray.count;
        self.pageControl.currentPage = page;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopScrollBanner];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startScrollBanner];
}
@end
