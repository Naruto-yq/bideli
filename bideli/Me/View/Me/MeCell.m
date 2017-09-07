//
//  MeCell.m
//  app
//
//  Created by 余钦 on 16/4/27.
//
//

#import "MeCell.h"
#import <UIImageView+WebCache.h>

#define cMarginH 22
#define iconW  50
#define  nickNameFont 17
#define  subtitleFont 14

@interface MeCell ()
@property(nonatomic, weak)UIImageView *iconView;
@property(nonatomic, weak)UILabel *titleLabel;
@property(nonatomic, weak)UILabel *subtitleLabel;
@property(nonatomic, weak)UIImageView *arrowView;
@property(nonatomic, weak)UIView *topLine;
@property(nonatomic, weak)UIView *bottomLine;
//@property(nonatomic, weak)UIView *redTipView;
@property(nonatomic, weak)UILabel *numberLabel;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation MeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"MeCell";
    MeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[MeCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.tableView = tableView;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self SetupSubviews];
    }
    return self;
}

- (void)SetupSubviews
{
    UIImageView *iconView = [[UIImageView alloc]init];
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = HEXCOLOR(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:settingCellFontSize];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *subtitleLabel = [[UILabel alloc]init];
    subtitleLabel.text = @"  ";
    subtitleLabel.textColor = HEXCOLOR(0x666666);
    subtitleLabel.font = [UIFont systemFontOfSize:subtitleFont];
    subtitleLabel.hidden = YES;
    [self.contentView addSubview:subtitleLabel];
    self.subtitleLabel = subtitleLabel;
    
    UIImageView *arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    [self.contentView addSubview:arrowView];
    self.arrowView = arrowView;
    
    UIView *redTipView = [[UIView alloc]init];
    redTipView.backgroundColor = [UIColor redColor];
    redTipView.clipsToBounds = YES;
    redTipView.layer.cornerRadius = 4.0f;
    redTipView.hidden = YES;
    [self.contentView addSubview:redTipView];
    self.redTipView = redTipView;
    
    UILabel *numberLabel = [[UILabel alloc]init];
    numberLabel.textColor = HEXCOLOR(0x3a5ba8);
    numberLabel.textAlignment = NSTextAlignmentRight;
    numberLabel.font = [UIFont systemFontOfSize:12];
    numberLabel.hidden = YES;
    [self.contentView addSubview:numberLabel];
    self.numberLabel = numberLabel;
    
    UIView *topLine = [[UIView alloc]init];
    topLine.backgroundColor = HEXCOLOR(0xeaeaea);
    [self.contentView addSubview:topLine];
    self.topLine = topLine;
    
//    UIView *bottomLine = [[UIView alloc]init];
//    bottomLine.hidden = YES;
//    bottomLine.backgroundColor = HEXCOLOR(0xeaeaea);
//    [self.contentView addSubview:bottomLine];
//    self.bottomLine = bottomLine;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak __typeof(self)wSelf = self;
    
    if (self.indexPath.section == 0) {
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(wSelf.contentView);
            make.left.mas_equalTo(wSelf.contentView).offset(20);
            make.height.width.mas_equalTo(iconW);
        }];
    }else{
        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(wSelf.contentView);
            make.left.mas_equalTo(wSelf.contentView).offset(20);
            make.height.width.mas_equalTo(17);
        }];
    }
   
    if (self.indexPath.section == 0) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(wSelf.iconView).offset(-10);
            make.left.mas_equalTo(wSelf.iconView.mas_right).offset(cMarginH/2.0f);
            make.right.mas_equalTo(wSelf.contentView.mas_right).offset(-30);
            make.height.mas_equalTo(20.0f);
        }];
    }else{
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(wSelf.iconView);
            make.left.mas_equalTo(wSelf.iconView.mas_right).offset(cMarginH/2.0f);
            make.height.mas_equalTo(20.0f);
        }];
    }
    
    if (self.indexPath.section == 0) {
        [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(wSelf.titleLabel.mas_bottom).offset(6);
            make.left.mas_equalTo(wSelf.titleLabel);
            make.height.mas_equalTo(15.0f);
        }];
    }
    
    [self.redTipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(wSelf.titleLabel.mas_right).offset(5);
        make.centerY.mas_equalTo(wSelf.contentView);
        make.width.height.mas_equalTo(8.0f);
    }];
    
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(wSelf.contentView);
        make.right.mas_equalTo(wSelf.contentView.mas_right).offset(-20);
        make.width.height.mas_equalTo(cellArrowW);
    }];
    
    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wSelf.arrowView.mas_left).offset(-cMarginH/2.0f);
        make.centerY.mas_equalTo(wSelf.contentView);
        make.width.mas_equalTo(iconW);
    }];
    
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wSelf.contentView);
        make.left.right.mas_equalTo(wSelf.contentView);
        make.width.mas_equalTo(wSelf.contentView.bounds.size.width);
        make.height.mas_equalTo(0.5f);
    }];
    
//    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(wSelf.topLine).offset(wSelf.contentView.bounds.size.height-0.5);
//        make.left.right.width.height.mas_equalTo(wSelf.topLine);
//    }];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    int totalRows = (int)[self.tableView numberOfRowsInSection:indexPath.section];

    if (totalRows == 1) {//只有
        self.iconView.clipsToBounds = YES;
        self.iconView.layer.cornerRadius = iconW/2.0f;
        self.iconView.contentMode = UIViewContentModeScaleAspectFill;
    
//        NSString *iconUrl = [NSString stringWithFormat:@"%@%@", IPADDRESS, _userInfo.imgurl];
//        [self.iconView sd_setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"user_icon"]];
        self.iconView.image = [UIImage imageNamed:@"user_icon"];
        self.bottomLine.hidden = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:nickNameFont];
        self.titleLabel.text = @"9527xxx";
        self.subtitleLabel.text = @"132****9192";
        self.subtitleLabel.hidden = NO;
    }else if (indexPath.row == totalRows - 1) { // 尾行
        self.bottomLine.hidden = NO;
    }
    
    if (indexPath.section == 0) {
        self.titleLabel.textColor = HEXCOLOR(0x333333);
    }else {
        self.titleLabel.textColor = HEXCOLOR(0x666666);
    }
}

//- (void)setBankCardCount:(NSUInteger)bankCardCount {
//    _bankCardCount = bankCardCount;
//    if (bankCardCount > 0 && self.indexPath.section == 1 && self.indexPath.row == 0) {
//        self.numberLabel.hidden = NO;
//        self.numberLabel.text = [NSString stringWithFormat:@"%ld张", bankCardCount];
//    }else {
//        self.numberLabel.hidden = YES;
//    }
//}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.text = title;
}

- (void)setIconName:(NSString *)iconName{
    _iconName = iconName;
    self.iconView.image = [UIImage imageNamed:iconName];
}

- (void)setUserInfo:(UserInfo *)userInfo{
    _userInfo = userInfo;
}
@end
