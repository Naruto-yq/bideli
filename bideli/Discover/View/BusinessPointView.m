//
//  BusinessPointView.m
//  bideli
//
//  Created by Yanglijuan on 2017/9/6.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "BusinessPointView.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MapPointModel.h"
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import "MapPointAnnotation.h"

@interface BusinessPointView()

@property (nonatomic,weak) UIImageView *bgView;
@property (nonatomic,weak) UILabel *titleLabel;     // 名称
@property (nonatomic,weak) UILabel *nameLabel;     // 名称
@property (nonatomic,weak) UIImageView *imageView; //头像

@end

@implementation BusinessPointView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (instancetype)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
//    if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]) {
//        [self setupSubviews];
//    }
//    return self;
//}
//
//+ (instancetype)annotationViewWithMap:(BMKMapView *)mapView withAnnotation:(id <BMKAnnotation>)annotation {
//    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
//        static NSString *identifier = @"annotation";
//        // 1.从缓存池中取
//        BusinessPointView *annoView = (BusinessPointView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
//        // 2.如果缓存池中没有, 创建一个新的
//        if (annoView == nil) {
//            annoView = [[BusinessPointView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
//        }
//        if ([annotation isKindOfClass:[MapPointAnnotation class]]) {
//            annoView.annotation = (MapPointAnnotation *)annotation;
//        }
//        
//        annoView.image = [UIImage imageNamed:@"mapPointBg"];
//        return annoView;
//    }
//    return nil;
//}

+ (instancetype)businessPointViewWithMapView:(BMKMapView *)mapView Annotation:(id<BMKAnnotation>)annotation {
    NSString *identifier = @"businessPointView";
    BusinessPointView *mapPointView = (BusinessPointView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (mapPointView == nil) {
        mapPointView = [[BusinessPointView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        // 从天上掉下效果
        mapPointView.animatesDrop = YES;
        // 设置可拖拽
        mapPointView.draggable = NO;
        mapPointView.enabled = YES;
    }
    mapPointView.userInteractionEnabled = YES;
    return mapPointView;
}

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 120)];
        [view setUserInteractionEnabled:YES];
        [self addSubview:view];
        [view setImage:[UIImage imageNamed:@"mapPointBg"]];
        _bgView = view;
        UIGestureRecognizer *ges = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(annotationDidSelectAction)];
        [view addGestureRecognizer:ges];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame)/2.0f - 15, 40, 30, 30)];
        [image setImage:[UIImage imageNamed:@"common_img_agent"]];
        image.layer.cornerRadius = 15;
        image.layer.masksToBounds = YES;
        [_bgView addSubview:image];
        _imageView = image;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), CGRectGetWidth(view.frame), 18)];
        label.textColor = kC9_FFFFFF;
        label.font = kF7_12;
        label.text = MyLocalizedString(@"BusinessLabelText");
        label.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:label];
        _nameLabel = label;
    }
    return self;
}

- (void)setMapPointModel:(MapPointModel *)mapPointModel {
    _mapPointModel = mapPointModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:mapPointModel.imageUrl] placeholderImage:[UIImage imageNamed:@"common_img_agent"]];
    self.nameLabel.text = mapPointModel.name;
}

- (void)annotationDidSelectAction {
    NSLog(@"点击标注");
}
@end
