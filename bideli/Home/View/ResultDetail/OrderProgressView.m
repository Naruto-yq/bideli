//
//  OrderProgressView.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年   reserved.
//

#import "OrderProgressView.h"
@interface OrderProgressView ()
@property (nonatomic, weak) UIView *lineView;
@end

@implementation OrderProgressView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = HEXCOLOR(0xfbd860);
    [self addSubview:lineView];
    self.lineView = lineView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat lineY = rHeight(40);
    CGFloat lineH = ViewH(self)-2*lineY;
    self.lineView.frame = CGRectMake(IndicateLeftMargin, lineY, 1, lineH);
    
    NSArray *array = @[@"您创建了购买订单\n打款人：张三\n打款银行：中国银行\n打款帐号:**** **** 4967",
                       @"您选择了共享者：qin，等待共享者接单",
                       @"共享者支付5000元保证金成功",
                       @"等待您向共享者qin线下打款\n打款备注：购买原石订单-890923",
                       @"共享者确认收款"
                       ];
    
    CGFloat iconH = 30;
    for (int i=0; i<5; i++) {
        UIImageView *completeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"complete_icon"]];
        completeView.frame = CGRectMake(IndicateLeftMargin-15, lineY + i*(lineH/4)-15, iconH, iconH);
        [self addSubview:completeView];
        
        UILabel *progressLabel = [UILabel new];
        progressLabel.font = [UIFont systemFontOfSize:13];
        progressLabel.textAlignment = NSTextAlignmentLeft;
        progressLabel.textColor = [UIColor blackColor];
        progressLabel.numberOfLines = 0;
        progressLabel.text = array[i];
        progressLabel.frame = CGRectMake(IndicateLeftMargin+20, lineY + i*(lineH/4) - lineH/8, ViewW(self)-(IndicateLeftMargin+20)-30, lineH/4);
        [self addSubview:progressLabel];
    }
}

@end
