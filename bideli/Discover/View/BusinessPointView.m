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


@interface BusinessPointView()

@property (nonatomic,weak) UIImageView *bgView;
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
    return mapPointView;
}

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 100)];
        [view setUserInteractionEnabled:YES];
        [self addSubview:view];
        [view setImage:[UIImage imageNamed:@"mapPointBg"]];
        _bgView = view;
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = kC9_FFFFFF;
        label.font = kF5_14;
        label.text = MyLocalizedString(@"BusinessLabelText");
        label.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:label];
        _nameLabel = label;
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [image setImage:[UIImage imageNamed:@"common_img_agent"]];
        image.layer.cornerRadius = 30;
        image.layer.masksToBounds = YES;
        [_bgView addSubview:image];
        _imageView = image;
    }
    return self;
}

- (void)setMapPointModel:(MapPointModel *)mapPointModel {
    _mapPointModel = mapPointModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:mapPointModel.imageUrl] placeholderImage:[UIImage imageNamed:@"common_img_agent"]];
    self.nameLabel.text = mapPointModel.name;
}




@end
