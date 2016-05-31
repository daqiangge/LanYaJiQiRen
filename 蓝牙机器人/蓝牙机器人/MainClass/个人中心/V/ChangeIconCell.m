//
//  ChangeIconCell.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChangeIconCell.h"

@interface ChangeIconCell ()

@property (nonatomic, weak) UIImageView *iconImageView;

@end

@implementation ChangeIconCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (ChangeIconCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"ChangeIconCell";
    ChangeIconCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[ChangeIconCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = [UIImage imageNamed:@"PC_ic-userImg002"];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"更换头像";
    [self.contentView addSubview:label];
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"icon_classification_more"];
    [self.contentView addSubview:arrowImageView];
    
    iconImageView.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(40);
    iconImageView.sd_cornerRadiusFromWidthRatio = @(0.5);

    label.sd_layout
    .leftSpaceToView(iconImageView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(100);
    
    arrowImageView.sd_layout
    .rightSpaceToView(self.contentView,SPACEING_10)
    .centerYEqualToView(label)
    .widthIs(12)
    .heightIs(12);
    
}

- (void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    
    self.iconImageView.image = [UIImage imageNamed:@"PC_ic-userImg002"];
}

@end
