//
//  SuccessRegisterViewController.m
//  app
//
//  Created by 余钦 on 16/4/26.
//
//

#import "SuccessRegisterViewController.h"

@interface SuccessRegisterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipCountdownLabel;
@property(nonatomic, strong)NSTimer *timer;
@property(nonatomic, assign)int totalSecond;
@end

@implementation SuccessRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXCOLOR(0xf2f2f7);
    self.totalSecond = 3;
    self.tipCountdownLabel.attributedText = [self SetDifferentColorWithString:MyLocalizedString(@"SuccessRegister")
                                                                     valueStr:[NSString stringWithFormat:@"%d", self.totalSecond] tailStr:MyLocalizedString(@"ReturnInvestmentUI")];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerCountdown:) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)timerCountdown:(NSTimer *)timer
{
    self.totalSecond--;
    if (self.totalSecond <= -1) {
        [self JumpToHome];
    }else{
        NSString *Seconds = [NSString stringWithFormat:@"%d", self.totalSecond];
        self.tipCountdownLabel.attributedText = [self SetDifferentColorWithString:MyLocalizedString(@"SuccessRegister")
                                                 valueStr:Seconds tailStr:MyLocalizedString(@"ReturnInvestmentUI")];
    }
}

- (void)JumpToHome
{
    if (self.timer) {
        if ([self.timer respondsToSelector:@selector(isValid)]) {
            if ([self.timer isValid]) {
                [self.timer invalidate];
                self.timer = nil;
            }
        }
    }

    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (NSAttributedString *)SetDifferentColorWithString:(NSString *)headerStr valueStr:(NSString *)valueStr tailStr:(NSString *)tailStr
{
    NSString *wholeString = [NSString stringWithFormat:@"%@ %@秒 %@", headerStr, valueStr, tailStr];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:wholeString];
    
    NSUInteger headerLen = headerStr.length;
    NSUInteger valueLen = valueStr.length;
    NSUInteger tailLen = tailStr.length;
    
    
    [attrStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x999999) range:NSMakeRange(0, headerLen)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x5584d5) range:NSMakeRange(headerLen+1, valueLen)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0x999999) range:NSMakeRange(headerLen+valueLen+1, tailLen+2)];
    return attrStr;
}
@end
