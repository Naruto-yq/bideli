//
//  shopInfoView.m
//  bideli
//
//  Created by Yanglijuan on 2017/9/29.
//  Copyright © 2017年 bideli. All rights reserved.
//

#import "shopInfoView.h"

@implementation shopInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)createWithNib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}



@end
