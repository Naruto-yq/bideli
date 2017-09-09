//
//  BankCardInfo.h
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString *bankPuFa = @"0310"; //浦东发展银行
static const NSString *bankYouZheng = @"0403"; //国家邮政储蓄银行
static const NSString *bankGongShang = @"0102"; //工商银行
static const NSString *bankNongYe = @"0103"; //农业银行
static const NSString *bankZhongGuo = @"0104"; //中国银行
static const NSString *bankJianShe = @"0105"; //建设银行
static const NSString *bankJiaoTong = @"0301"; //交通银行
static const NSString *bankZhongXin = @"0302"; //中信银行
static const NSString *bankGuangDa = @"0303"; //光大银行
static const NSString *bankHuaXia = @"0304"; //华夏银行
static const NSString *bankMinSheng = @"0305"; //民生银行
static const NSString *bankGuangFa = @"0306"; //广发银行
static const NSString *bankPingAn = @"0307"; //平安银行
static const NSString *bankZhaoShang = @"0308"; //招商银行
static const NSString *bankXingYe = @"0309"; //兴业银行

@interface BankCardInfo : NSObject
@property (nonatomic, copy) NSString *appbanklogomax;
@property (nonatomic, copy) NSString *appbanklogomin;
@property (nonatomic, copy) NSString *appwatermarklogo;
@property (nonatomic, copy) NSString *appwatermarklogomax;
@property (nonatomic, copy) NSString *bankaccount;
@property (nonatomic, copy) NSString *bankcode;
@property (nonatomic, copy) NSString *banklogo;
@property (nonatomic, copy) NSString *bankmobile;
@property (nonatomic, copy) NSString *bankname;
@property (nonatomic, copy) NSString *custname;
@property (nonatomic, copy) NSString *depositaccount;
@property (nonatomic, copy) NSString *ismain;
@property (nonatomic, copy) NSString *jointcardtype;
@property (nonatomic, copy) NSString *cardtype;
@property (nonatomic, copy) NSString *max_in;
@property (nonatomic, copy) NSString *max_in_day;
@end
