//
//  BankCardInfo.m
//  bideli
//
//  Created by 杨丽娟 on 17/9/9.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "BankCardInfo.h"

@implementation BankCardInfo
- (NSString *)banklogo {
    NSString *bankCardLogoName = nil;
    
    if ([bankPuFa compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_pf";
    }else if ([bankYouZheng compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_yz";
    }else if ([bankGongShang compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_gs";
    }else if ([bankNongYe compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_ny";
    }else if ([bankZhongGuo compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_zg";
    }else if ([bankJianShe compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_js";
    }else if ([bankJiaoTong compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_jt";
    }else if ([bankZhongXin compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_zx";
    }else if ([bankGuangDa compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_gd";
    }else if ([bankHuaXia compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_hx";
    }else if ([bankMinSheng compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_ms";
    }else if ([bankGuangFa compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_gf";
    }else if ([bankPingAn compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_pa";
    }else if ([bankZhaoShang compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_zs";
    }else if ([bankXingYe compare:self.bankcode] == NSOrderedSame) {
        bankCardLogoName = @"bank_xy";
    }
    
    return bankCardLogoName;
}

- (NSString *)appwatermarklogo {
    NSString *bankCardWatermarkbg = nil;
    
    if ([bankPuFa compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_pf_bg";
        
    }else if ([bankYouZheng compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_yz_bg";
        
    }else if ([bankGongShang compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_gs_bg";
        
    }else if ([bankNongYe compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_ny_bg";
        
    }else if ([bankZhongGuo compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_zg_bg";
        
    }else if ([bankJianShe compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_js_bg";
        
    }else if ([bankJiaoTong compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_jt_bg";
        
    }else if ([bankZhongXin compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_zx_bg";
        
    }else if ([bankGuangDa compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_gd_bg";
        
    }else if ([bankHuaXia compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_hx_bg";
        
    }else if ([bankMinSheng compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_ms_bg";
        
    }else if ([bankGuangFa compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_gf_bg";
        
    }else if ([bankPingAn compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_pa_bg";
        
    }else if ([bankZhaoShang compare:self.bankcode] == NSOrderedSame) {
        
        bankCardWatermarkbg = @"bank_zs_bg";
        
    }else if ([bankXingYe compare:self.bankcode] == NSOrderedSame) {
        bankCardWatermarkbg = @"bank_xy_bg";
    }
    
    return bankCardWatermarkbg;
}

- (NSString *)cardtype {
    if (_cardtype.length) {
        return _cardtype;
    }else {
        return @"借记卡";
    }
}
@end
