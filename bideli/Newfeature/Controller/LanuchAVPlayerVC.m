//
//  LanuchAVPlayerVC.m
//  bideli
//
//  Created by 余钦 on 2017/9/8.
//  Copyright © 2017年 CMB Qianhai Financial Asset Exchange Co.Ltd. All rights reserved.
//

#import "LanuchAVPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
#import "QJMainTabBarController.h"
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import "LocationPermissionsViewController.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define kIsFirstLauchApp @"kIsFirstLauchApp"

@interface LanuchAVPlayerVC ()<BMKLocationServiceDelegate>
/** 播放开始之前的图片 */
@property (nonatomic , strong)UIImageView *startPlayerImageView;
/** 播放中断时的图片 */
@property (nonatomic , strong)UIImageView *pausePlayerImageView;
/** 定时器 */
@property (nonatomic , strong)NSTimer *timer;
/** 结束按钮 */
@property (nonatomic , strong)UIButton *enterMainButton;
@end

@implementation LanuchAVPlayerVC

- (BOOL)shouldAutorotate {
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置界面
    [self setupView];
    //添加监听
    [self addNotification];
    //初始化视频
    [self prepareMovie];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:8.0 target:self selector:@selector(enterMain) userInfo:nil repeats:NO];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.timer invalidate];
    self.timer = nil;
    self.player = nil;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //隐藏状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
#pragma mark -- 初始化视频
- (void)prepareMovie {
    //首次运行
    NSString *filePath = nil;
    if (![self isFirstLauchApp]) {
        //第一次安装
        filePath = [[NSBundle mainBundle] pathForResource:@"lanuch_movie.mp4" ofType:nil];
        [self setIsFirstLauchApp:YES];
    }else {
        filePath = [[NSBundle mainBundle] pathForResource:@"lanuch_movie.mp4" ofType:nil];
    }
    //初始化player
    self.player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:filePath]];
    self.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.showsPlaybackControls = NO;
    //播放视频
    [self.player play];
    
    
}


#pragma mark -- 初始化视图逻辑
- (void)setupView {
    self.view.userInteractionEnabled = NO;
    self.startPlayerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"movie_placeholder"]];
    _startPlayerImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.contentOverlayView addSubview:_startPlayerImageView];
}


#pragma mark -- 进入应用和显示进入按钮
- (void)enterMainAction:(UIButton *)btn {
    //视频暂停
    [self.player pause];
    self.pausePlayerImageView = [[UIImageView alloc] init];
    _pausePlayerImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.contentOverlayView addSubview:_pausePlayerImageView];
    self.pausePlayerImageView.contentMode = UIViewContentModeScaleAspectFit;
    //获取当前暂停时的截图
    [self getoverPlayerImage];
}
- (void)getoverPlayerImage {
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:self.player.currentItem.asset];
    gen.appliesPreferredTrackTransform = YES;
    NSError *error = nil;
    CMTime actualTime;
    CMTime now = self.player.currentTime;
    [gen setRequestedTimeToleranceAfter:kCMTimeZero];
    [gen setRequestedTimeToleranceBefore:kCMTimeZero];
    CGImageRef image = [gen copyCGImageAtTime:now actualTime:&actualTime error:&error];
    if (!error) {
        UIImage *thumb = [[UIImage alloc] initWithCGImage:image];
        self.pausePlayerImageView.image = thumb;
    }
    NSLog(@"%f , %f",CMTimeGetSeconds(now),CMTimeGetSeconds(actualTime));
    NSLog(@"%@",error);
    //视频播放结束
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self moviePlaybackComplete];
    });
    
}
//显示进入按钮
- (void)showEnterMainButton {
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:self.player.currentItem.asset];
    gen.appliesPreferredTrackTransform = YES;
    NSError *error = nil;
    CMTime actualTime;
    CMTime now = self.player.currentTime;
    [gen setRequestedTimeToleranceAfter:kCMTimeZero];
    [gen setRequestedTimeToleranceBefore:kCMTimeZero];
    [gen copyCGImageAtTime:now actualTime:&actualTime error:&error];
    NSInteger currentPlayBackTime = (NSInteger)CMTimeGetSeconds(actualTime);
    if (currentPlayBackTime >= 3) {
        self.enterMainButton.hidden = NO;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.enterMainButton.alpha = 0;
            [UIView animateWithDuration:0.5 animations:^{
                self.enterMainButton.alpha = 1;
            } completion:nil];
        });
    }
    if (currentPlayBackTime > 5) {
        //防止没有显现出来
        self.enterMainButton.alpha = 1;
        self.enterMainButton.hidden = NO;
        [self.timer invalidate];
        self.timer = nil;
    }
}
//进入主界面
- (void)enterMain {
    [self startLocation];

//    APPD.keyWindow.rootViewController = [[QJMainTabBarController alloc] init];
}

#pragma mark --定位开启
- (void)startLocation {
    // 判断该用户是否已经对房产网定位进行过授权
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) { // 暂未授权
        // 展示位置授权页
        LocationPermissionsViewController *locationPermissionsVC = [[LocationPermissionsViewController alloc] init];
        [self restoreRootViewController:locationPermissionsVC];
    } else {
        // 将UITabBarController设置为跟控制器
        [UIApplication sharedApplication].keyWindow.rootViewController = [[QJMainTabBarController alloc] init];
    }
}

// 登陆后淡入淡出更换rootViewController
- (void)restoreRootViewController:(UIViewController *)rootViewController {
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
}

#pragma mark -- 监听以及实现方法
- (void)addNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];//进入前台
    if ([self isFirstLauchApp]) {
        //第二次进入app视频需要直接结束
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackComplete) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];//视频播放结束
    }else {
        //第一次进入app视频需要轮播
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackAgain) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];//视频播放结束
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlaybackStart) name:AVPlayerItemTimeJumpedNotification object:nil];//播放开始
}
//再一次播放视频
- (void)moviePlaybackAgain {
    self.startPlayerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lauchAgain"]];
    _startPlayerImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.contentOverlayView addSubview:_startPlayerImageView];
    [self.pausePlayerImageView removeFromSuperview];
    self.pausePlayerImageView = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"lanuch_movie.mp4" ofType:nil];
    //初始化player
    self.player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:filePath]];
    self.showsPlaybackControls = NO;
    //播放视频
    [self.player play];
}
//开始播放
- (void)moviePlaybackStart {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.startPlayerImageView removeFromSuperview];
        self.startPlayerImageView = nil;
    });
}
//视频播放完成
- (void)moviePlaybackComplete {
    //发送推送之后就删除  否则 界面显示有问题
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:AVPlayerItemDidPlayToEndTimeNotification
                                                  object:nil];
    
    [self.startPlayerImageView removeFromSuperview];
    self.startPlayerImageView = nil;
    
    [self.pausePlayerImageView removeFromSuperview];
    self.pausePlayerImageView = nil;
    
    if (self.timer){
        [self.timer invalidate];
        self.timer = nil;
    }
    //进入主界面
    [self enterMain];
}
- (void)viewWillEnterForeground
{
    NSLog(@"app enter foreground");
    if (!self.player) {
        [self prepareMovie];
    }
    //播放视频
    [self.player play];
}

#pragma mark -- 是否第一次进入app
- (BOOL)isFirstLauchApp {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kIsFirstLauchApp];
}

- (void)setIsFirstLauchApp:(BOOL)isFirstLauchApp
{
    [[NSUserDefaults standardUserDefaults] setBool:isFirstLauchApp forKey:kIsFirstLauchApp];
}
@end
