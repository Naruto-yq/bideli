//
//  shopInfoView.h
//  bideli
//
//  Created by Yanglijuan on 2017/9/29.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shopInfoView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;

+ (instancetype)createWithNib;

@end
