//
//  BusinessPointView.m
//  bideli
//
//  Created by Yanglijuan on 2017/9/6.
//  Copyright © 2017年   reserved.
//

#import "BusinessPointView.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "MapPointModel.h"
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>
#import "MapPointAnnotation.h"

@interface BusinessPointView(){
    UIImageView *bgView;
    UILabel *nameLabel;
    UIImageView *imageView;
}
//@property (nonatomic,weak) UIImageView *bgView;
//@property (nonatomic,weak) UIImageView *bgView;     // 名称
//@property (nonatomic,weak) UILabel *nameLabel;     // 名称
//@property (nonatomic,weak) UIImageView *imageView; //头像

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
        mapPointView.enabled = YES;
        mapPointView.image = [mapPointView initializeBaseView];
    }
    mapPointView.userInteractionEnabled = YES;
    return mapPointView;
}

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
//        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 120)];
//        [view setUserInteractionEnabled:YES];
//        [self addSubview:view];
//        [view setImage:[UIImage imageNamed:@"mapPointBg"]];
//        _bgView = view;
//        UIGestureRecognizer *ges = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(annotationDidSelectAction)];
//        [view addGestureRecognizer:ges];
//        
//        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame)/2.0f - 15, 40, 30, 30)];
//        [image setImage:[UIImage imageNamed:@"common_img_agent"]];
//        image.layer.cornerRadius = 15;
//        image.layer.masksToBounds = YES;
//        [_bgView addSubview:image];
//        _imageView = image;
//        
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), CGRectGetWidth(view.frame), 18)];
//        label.textColor = kC9_FFFFFF;
//        label.font = kF7_12;
//        label.text = MyLocalizedString(@"BusinessLabelText");
//        label.textAlignment = NSTextAlignmentCenter;
//        [_bgView addSubview:label];
//        _nameLabel = label;
    }
    return self;
}

- (void)setMapPointModel:(MapPointModel *)mapPointModel {
    _mapPointModel = mapPointModel;
    [imageView sd_setImageWithURL:[NSURL URLWithString:mapPointModel.imageUrl] placeholderImage:[UIImage imageNamed:@"common_img_agent"]];
    nameLabel.text = mapPointModel.name;
}

- (UIImage *)initializeBaseView {
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 120)];
    [view setUserInteractionEnabled:YES];
    [view setImage:[UIImage imageNamed:@"mapPointBg"]];
    bgView = view;
    //    [self addSubview:view];
    //        UIGestureRecognizer *ges = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(annotationDidSelectAction)];
    //        [view addGestureRecognizer:ges];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(view.frame)/2.0f - 15, 40, 30, 30)];
    [image setImage:[UIImage imageNamed:@"common_img_agent"]];
    image.layer.cornerRadius = 15;
    image.layer.masksToBounds = YES;
    [bgView addSubview:image];
    imageView = image;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image.frame), CGRectGetWidth(view.frame), 18)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"测试测试";
    label.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:label];
    nameLabel = label;
    UIImage *bgImage = [self convertViewToImage:view];
    return bgImage;
}

/**
 转image工具方法
 
 @param view 需要转换的原始view
 @return 图片
 */
- (UIImage*)convertViewToImage:(UIView*)view {
    CGSize size = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
