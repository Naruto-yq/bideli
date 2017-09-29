//
//  CreditView.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年   reserved.
//

#import "CreditView.h"

@interface CreditView ()
@property (nonatomic, weak) UILabel *creditLabel;
@end

@implementation CreditView
- (instancetype)init {
    self = [super init];
    if (self) {
        UILabel *creditLabel = [UILabel new];
        creditLabel.textColor = HEXCOLOR(0x999999);
        creditLabel.text = MyLocalizedString(@"Credit");
        creditLabel.font = [UIFont systemFontOfSize:rFontSize(13)];
        creditLabel.textAlignment= NSTextAlignmentLeft;
        [self addSubview:creditLabel];
        self.creditLabel = creditLabel;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.creditLabel.frame = CGRectMake(0, 0, rWidth(28), ViewH(self));
    
    CGFloat iconH = 18;
    for (int i=0; i<self.creditCount; i++) {
        UIImageView *creditIconView = [UIImageView new];
        creditIconView.image = [UIImage imageNamed:@"credit_icon"];
        [self addSubview:creditIconView];
        creditIconView.frame = CGRectMake(rWidth(28)+i*(iconH), (ViewH(self)-iconH)/2, iconH, iconH);
    }
}
- (void)setCreditCount:(NSInteger)creditCount {
    _creditCount = creditCount;
}
@end
