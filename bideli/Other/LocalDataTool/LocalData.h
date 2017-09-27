//
//  LocalData.h
//  app
//
//  Created by 余钦 on 2017/2/23.
//
//

#import <Foundation/Foundation.h>

#define GLobalLocalData [LocalData LocalDataInstance]

@interface LocalData : NSObject
+ (LocalData *) LocalDataInstance;

- (NSString *)getVCInvalidStateWithKey:(NSString *)key;
- (void)setVCInvalidState:(NSString *)state Key:(NSString *)key;

- (NSString *)getTabIconsTimesp;
- (void)setTabIconsTimesp:(NSString *)timesp;

- (NSString *)getOCRShowState;
- (void)setOCRShowState:(NSString *)state;

//登录状态
- (NSString *)getLoginState;
- (void)setLoginState:(NSString *)state;

//新手状态
- (NSString *)getNewerState;
- (void)setNewerState:(NSString *)state;

//获取app userID
- (NSString *)getAppUserID;
- (void)setAppUserID:(NSString *)userID;

//绑卡状态
- (NSString *)getBindCardState;
- (void)setBindCardState:(NSString *)state;

- (NSString *)getIsReturn2Home;
- (void)setIsReturn2Home:(NSString *)state;

//游客状态
- (NSString *)getVisitorState;
- (void)setVisitorState:(NSString *)state;

//新手活动状态
- (NSString *)getNewerEventState;
- (void)setNewerEventState:(NSString *)state;

- (NSString *)getHavePwdState;
- (void)setHavePwdState:(NSString *)state;

- (NSString *)getTapLanuchAdViewState;
- (void)setTapLanuchAdViewState:(NSString *)state;

- (NSString *)getTabBarSelectedIndex;
- (void)setTabBarSelectedIndex:(NSString *)selectedIndex;

//指纹是否打开
- (NSString *)getTouchIDState;
- (void)setTouchIDState:(NSString *)state;

- (NSString *)getTouchIDChangeState;
- (void)setTouchIDChangeState:(NSString *)state;

- (NSString *)getSetTouchIDCount;
- (void)setSetTouchIDCount:(NSString *)count;

- (NSString *)getEvaluateTouchIDCount;
-(void)setEvaluateTouchIDCount:(NSString *)count;

- (NSString *)getShowEvaluateTouchIDState;
- (void)setShowEvaluateTouchIDState:(NSString *)state;

- (NSString *)getTouchIDSetTimesp;
- (void)setTouchIDSetTimesp:(NSString *)timesp;
@end
