//
//  UserInfoCell.m
//  app
//
//  Created by 余钦 on 16/4/27.
//
//

#import "UserInfoCell.h"
#import <UIImageView+WebCache.h>

#define cMarginH 22

#define iconW 38

@interface UserInfoCell ()
@property(nonatomic, weak)UIImageView *iconView;
@property(nonatomic, weak)UILabel *titleLabel;
@property(nonatomic, weak)UIImageView *arrowView;
@property(nonatomic, weak)UIView *topLine;
@property(nonatomic, weak)UIView *bottomLine;
@property(nonatomic, weak)UIView *redTipView;
@property(nonatomic, weak)UILabel *detailLabel;
@property (nonatomic, weak) UITableView *tableView;
@end

@implementation UserInfoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"userCell";
    UserInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UserInfoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
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
    iconView.hidden = YES;
    iconView.contentMode = UIViewContentModeScaleAspectFill;
    iconView.clipsToBounds = YES;
    iconView.layer.cornerRadius = iconW/2.0f;
    [self.contentView addSubview:iconView];
    self.iconView = iconView;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = HEXCOLOR(0x666666);
    titleLabel.font = [UIFont systemFontOfSize:settingCellFontSize];
    [self.contentView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIImageView *arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
    [self.contentView addSubview:arrowView];
    self.arrowView = arrowView;
    
    
    UILabel *detailLabel = [[UILabel alloc]init];
    detailLabel.textColor = HEXCOLOR(0x666666);
    detailLabel.font = [UIFont systemFontOfSize:14];
    detailLabel.textAlignment = NSTextAlignmentRight;
    detailLabel.hidden = YES;
    [self.contentView addSubview:detailLabel];
    self.detailLabel = detailLabel;
    
    UIView *topLine = [[UIView alloc]init];
    topLine.backgroundColor = HEXCOLOR(0xeaeaea);
    [self.contentView addSubview:topLine];
    self.topLine = topLine;
    
    UIView *bottomLine = [[UIView alloc]init];
    bottomLine.hidden = YES;
    bottomLine.backgroundColor = HEXCOLOR(0xeaeaea);
    [self.contentView addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    __weak __typeof(self)wSelf = self;
    
    CGFloat titleW = 80.0f;
    CGFloat textLabelH = 20.0f;
    
    if (self.indexPath.section == 2) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(wSelf.contentView);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(textLabelH);
        }];
    }else {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(wSelf.contentView);
            make.left.mas_equalTo(wSelf.contentView).offset(20);
            make.width.mas_equalTo(titleW);
            make.height.mas_equalTo(textLabelH);
        }];
    }
    
    [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(wSelf.contentView);
        make.right.mas_equalTo(wSelf.contentView.mas_right).offset(-20);
        make.width.height.mas_equalTo(cellArrowW);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wSelf.arrowView.mas_left).offset(-cMarginH/2.0f);
        make.centerY.mas_equalTo(wSelf.contentView);
        make.left.mas_equalTo(wSelf.titleLabel.mas_right).offset(cMarginH);
        make.height.mas_equalTo(textLabelH);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(wSelf.arrowView.mas_left).offset(-cMarginH/2.0f);
        make.centerY.mas_equalTo(wSelf.contentView);
        make.width.height.mas_equalTo(iconW);
    }];
    
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wSelf.contentView);
        make.left.right.mas_equalTo(wSelf.contentView);
        make.width.mas_equalTo(wSelf.contentView.bounds.size.width);
        make.height.mas_equalTo(0.5f);
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(wSelf.topLine).offset(wSelf.contentView.bounds.size.height-0.5);
        make.left.right.width.height.mas_equalTo(wSelf.topLine);
    }];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    self.arrowView.hidden = NO;
    
    int totalRows = (int)[self.tableView numberOfRowsInSection:indexPath.section];
    
    if(indexPath.section == 0){
        self.detailLabel.hidden = YES;
        self.iconView.image = [UIImage imageNamed:@"user_icon"];
        self.iconView.hidden = NO;
    }
    
    if (indexPath.section == 1) {
        self.detailLabel.hidden = NO;
        if (indexPath.row == 0) {
            self.detailLabel.text = @"9527xxxx";
        }else if(indexPath.row == 1){
            self.detailLabel.text = @"13266799192";
        }
    }
    
    if (indexPath.row == totalRows - 1) { // 尾行
        self.bottomLine.hidden = NO;
    }
    
    if (indexPath.section == 2) {
         self.arrowView.hidden = YES;
    }

}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
}

- (void)setUserInfo:(UserInfo *)userInfo{
    _userInfo = userInfo;
}

- (void)setIcon:(UIImage *)icon {
    _icon = icon;
}
@end
