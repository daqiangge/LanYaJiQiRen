//
//  MainVCCell.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainVCCell.h"

@interface MainVCCell ()

@end

@implementation MainVCCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (MainVCCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"MainVCCell";
    MainVCCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[MainVCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *nameLabe1 = [[UILabel alloc] init];
    nameLabe1.font = [UIFont systemFontOfSize:15];
    nameLabe1.textColor = [UIColor blackColor];
    nameLabe1.text = @"机器人1号";
    [self.contentView addSubview:nameLabe1];
    
    UILabel *shiYongCiShuLabel = [[UILabel alloc] init];
    shiYongCiShuLabel.font = [UIFont systemFontOfSize:15];
    shiYongCiShuLabel.textColor = [UIColor grayColor];
    shiYongCiShuLabel.text = @"剩余次数：100";
    [self.contentView addSubview:shiYongCiShuLabel];
    
    UILabel *lianJieStateLabel = [[UILabel alloc] init];
    lianJieStateLabel.font = [UIFont systemFontOfSize:15];
    lianJieStateLabel.textColor = [UIColor blackColor];
    lianJieStateLabel.text = @"连接状态:";
    [self.contentView addSubview:lianJieStateLabel];
    
    UILabel *useStateLabel = [[UILabel alloc] init];
    useStateLabel.font = [UIFont systemFontOfSize:15];
    useStateLabel.textColor = [UIColor lightGrayColor];
    useStateLabel.text = @"设备状态:使用中";
    [self.contentView addSubview:useStateLabel];
    
    UISwitch *lianjieSwitch = [[UISwitch alloc] init];
    [self.contentView addSubview:lianjieSwitch];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lineView];
    
    nameLabe1.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .widthIs(150)
    .autoHeightRatio(0);
    [nameLabe1 setMaxNumberOfLinesToShow:1];
    
    shiYongCiShuLabel.sd_layout
    .leftSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,15)
    .widthIs(150)
    .autoHeightRatio(0);
    [shiYongCiShuLabel setMaxNumberOfLinesToShow:1];
    
    lianjieSwitch.sd_layout
    .rightSpaceToView(self.contentView,20)
    .centerYEqualToView(nameLabe1)
    .widthIs(150)
    .heightRatioToView(nameLabe1,1);
    
    lianJieStateLabel.sd_layout
    .rightSpaceToView(lianjieSwitch,5)
    .centerYEqualToView(nameLabe1)
    .widthIs(70)
    .heightRatioToView(nameLabe1,1);
    
    useStateLabel.sd_layout
    .leftEqualToView(lianJieStateLabel)
    .centerYEqualToView(shiYongCiShuLabel)
    .rightEqualToView(lianjieSwitch)
    .heightRatioToView(lianJieStateLabel,1);
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
    
}
@end
