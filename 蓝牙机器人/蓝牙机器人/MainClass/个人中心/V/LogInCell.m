//
//  LogInCell.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LogInCell.h"

@implementation LogInCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LogInCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LogInCell";
    LogInCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LogInCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    self.contentView.backgroundColor = [UIColor colorWithRed:0.443 green:0.518 blue:0.502 alpha:1.00];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:iconImageView];
    
    UIButton *logInBtn = [[UIButton alloc] init];
    [logInBtn setTitle:@"立即登录" forState:UIControlStateNormal];
    [logInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logInBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    logInBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    logInBtn.layer.borderWidth = 0.5;
    [self.contentView addSubview:logInBtn];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .widthIs(55)
    .heightIs(55);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    logInBtn.sd_layout
    .leftSpaceToView(iconImageView,15)
    .centerYEqualToView(iconImageView)
    .widthIs(80)
    .heightIs(25);
}

@end
