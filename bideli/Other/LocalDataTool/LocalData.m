//
//  LocalData.m
//  app
//
//  Created by 余钦 on 2017/2/23.
//
//

#import "LocalData.h"

#define login_state @"login_state"
#define newer_state @"newer_state"
#define bindCard_state @"bindCard_state"
#define visitor_state @"visitor_state"
#define App_userID  @"App_userID"
#define newerEvent_state @"newerEvent_state"
#define touchID_state    @"touchID_Switch_state"
#define touchID_Change_state @"touchID_Change_state"
#define set_TouchID_Count @"set_TouchID_Count"
#define evaluate_TouchID_Count @"evaluate_TouchID_Count"
#define touchID_showEvaluate_state    @"touchID_showEvaluate_state"
#define touchID_setTimesp   @"touchID_setTimesp"
#define tabicons_Timesp   @"tabicons_timesp"
#define tapLanuch_state   @"tapLanuch_state"
#define tabbar_selected_index    @"tabbar_selected_index"
#define IsReturnToHomeVC     @"IsReturnToHomeVcState"
#define havePwd_state @"haveLoginPwd_state"
#define showocr_state @"showocr_state"

@implementation LocalData
static LocalData* sharedInstance = nil;

+ (LocalData *) LocalDataInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LocalData alloc] init];
    });
    
    return sharedInstance;
}

- (NSString *)getVCInvalidStateWithKey:(NSString *)key {
    return [self get:key];
}

- (void)setVCInvalidState:(NSString *)state Key:(NSString *)key {
    [self setLocalData:key withValue:state];
}

- (NSString *)getLoginState {
    return [self get:login_state];
}

- (void)setLoginState:(NSString *)state {
    [self setLocalData:login_state withValue:state];
}

- (NSString *)getAppUserID {
    return [self get:App_userID];
}

- (void)setAppUserID:(NSString *)userID {
    [self setLocalData:App_userID withValue:userID];
}

- (NSString *)getNewerState {
    return [self get:newer_state];
}

- (void)setNewerState:(NSString *)state {
    [self setLocalData:newer_state withValue:state];
}

- (NSString *)getBindCardState {
    return [self get:bindCard_state];
}

- (void)setBindCardState:(NSString *)state {
    [self setLocalData:bindCard_state withValue:state];
}

- (NSString *)getIsReturn2Home {
    return [self get:IsReturnToHomeVC];
}

- (void)setIsReturn2Home:(NSString *)state {
    [self setLocalData:IsReturnToHomeVC withValue:state];
}

- (NSString *)getVisitorState {
    return [self get:visitor_state];
}

- (void)setVisitorState:(NSString *)state {
    [self setLocalData:visitor_state withValue:state];
}

- (NSString *)getNewerEventState {
    return [self get:newerEvent_state];
}

- (void)setNewerEventState:(NSString *)state {
    [self setLocalData:newerEvent_state withValue:state];
}

- (NSString *)getTouchIDChangeState {
    return [self get:touchID_Change_state];
}

- (void)setTouchIDChangeState:(NSString *)state {
    [self setLocalData:touchID_Change_state withValue:state];
}

- (NSString *)getTabIconsTimesp {
    return [self get:tabicons_Timesp];
}

- (void)setTabIconsTimesp:(NSString *)timesp {
    [self setLocalData:tabicons_Timesp withValue:timesp];
}

- (NSString *)getTapLanuchAdViewState {
    return [self get:tapLanuch_state];
}

- (void)setTapLanuchAdViewState:(NSString *)state {
    [self setLocalData:tapLanuch_state withValue:state];
}

- (NSString *)getTabBarSelectedIndex {
    return [self get:tabbar_selected_index];
}

- (void)setTabBarSelectedIndex:(NSString *)selectedIndex {
    [self setLocalData:tabbar_selected_index withValue:selectedIndex];
}

- (NSString *)getOCRShowState {
    return [self get:showocr_state];
}

- (void)setOCRShowState:(NSString *)state {
    [self setLocalData:showocr_state withValue:state];
}
#pragma mark - 全局设置返回方法
-(NSString *)get:(NSString *)param{
    if([self getLocalData:param] == nil || [[self getLocalData:param] isEqual: @""]) {
        return @"";
    }else{
        return [self getLocalData:param];
    }
}

#pragma mark - 全局设置方法
-(NSString *)getLocalData:(NSString *)key{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

-(void)setLocalData:(NSString *)key withValue:(NSString *)value{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark --- 保存和用户相关
- (NSString *)getHavePwdState {
    return [self getUserLocalData:havePwd_state];
}

- (void)setHavePwdState:(NSString *)state {
    [self setUserLocalData:havePwd_state withValue:state];
}

- (NSString *)getTouchIDState {
    return [self getUserLocalData:touchID_state];
}

- (void)setTouchIDState:(NSString *)state {
    [self setUserLocalData:touchID_state withValue:state];
}

- (NSString *)getSetTouchIDCount {
    return [self getUserLocalData:set_TouchID_Count];
}

- (void)setSetTouchIDCount:(NSString *)count {
    [self setUserLocalData:set_TouchID_Count withValue:count];
}

- (NSString *)getEvaluateTouchIDCount {
    return [self getUserLocalData:evaluate_TouchID_Count];
}

- (void)setEvaluateTouchIDCount:(NSString *)count {
    [self setUserLocalData:evaluate_TouchID_Count withValue:count];
}

- (NSString *)getShowEvaluateTouchIDState {
    return [self getUserLocalData:touchID_showEvaluate_state];
}

- (void)setShowEvaluateTouchIDState:(NSString *)state {
    [self setUserLocalData:touchID_showEvaluate_state withValue:state];
}

- (NSString *)getTouchIDSetTimesp {
    return [self getUserLocalData:touchID_setTimesp];
}

- (void)setTouchIDSetTimesp:(NSString *)timesp {
    [self setUserLocalData:touchID_setTimesp withValue:timesp];
}

-(NSString *)getUserLocalData:(NSString *)key {
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [useDef objectForKey:key];
    if ([dic valueForKey:GetLatestPhone()] == nil || [[dic valueForKey:GetLatestPhone()] isEqualToString:@""]) {
        return @"";
    }else {
        return [dic valueForKey:GetLatestPhone()];
    }
}

-(void)setUserLocalData:(NSString *)key withValue:(NSString *)value{
    NSUserDefaults *useDef = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [useDef objectForKey:key];
    NSMutableDictionary *useDefDic = nil;
    if (dic) {
        useDefDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    }else {
        useDefDic = [NSMutableDictionary dictionary];
    }
    
    [useDefDic safeSetObject:value forKey:GetLatestPhone()];
    [useDef setObject:useDefDic forKey:key];
    [useDef synchronize];

}
@end
