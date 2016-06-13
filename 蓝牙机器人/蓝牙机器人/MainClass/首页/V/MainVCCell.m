//
//  MainVCCell.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainVCCell.h"
#import "ModelDevice.h"

@interface MainVCCell ()

@property (nonatomic, weak) UILabel *nameLabe1;
@property (nonatomic, weak) UILabel *shiYongCiShuLabel;
@property (nonatomic, weak) UILabel *yiShiYongCiShuLabel;
@property (nonatomic, weak) UILabel *lianJieStateLabel;

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
    self.nameLabe1 = nameLabe1;
    
    //剩余次数
    UILabel *shiYongCiShuLabel = [[UILabel alloc] init];
    shiYongCiShuLabel.font = [UIFont systemFontOfSize:15];
    shiYongCiShuLabel.textColor = [UIColor grayColor];
    shiYongCiShuLabel.text = @"剩余次数：100";
    [self.contentView addSubview:shiYongCiShuLabel];
    self.shiYongCiShuLabel = shiYongCiShuLabel;
    
    //已用次数
    UILabel *yiShiYongCiShuLabel = [[UILabel alloc] init];
    yiShiYongCiShuLabel.font = [UIFont systemFontOfSize:15];
    yiShiYongCiShuLabel.textColor = [UIColor grayColor];
    yiShiYongCiShuLabel.text = @"已用次数：100";
    [self.contentView addSubview:yiShiYongCiShuLabel];
    self.yiShiYongCiShuLabel = yiShiYongCiShuLabel;
    
    UILabel *lianJieStateLabel = [[UILabel alloc] init];
    lianJieStateLabel.font = [UIFont systemFontOfSize:15];
    lianJieStateLabel.textColor = [UIColor blackColor];
    lianJieStateLabel.text = @"连接状态:";
    [self.contentView addSubview:lianJieStateLabel];
    self.lianJieStateLabel = lianJieStateLabel;
    
//    UILabel *useStateLabel = [[UILabel alloc] init];
//    useStateLabel.font = [UIFont systemFontOfSize:15];
//    useStateLabel.textColor = [UIColor lightGrayColor];
//    useStateLabel.text = @"设备状态:使用中";
//    [self.contentView addSubview:useStateLabel];
    
    UISwitch *lianjieSwitch = [[UISwitch alloc] init];
    [lianjieSwitch addTarget:self action:@selector(didLianjie:) forControlEvents:UIControlEventValueChanged];
//    [self.contentView addSubview:lianjieSwitch];
    self.lianjieSwitch = lianjieSwitch;
    
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
    .widthIs((ScreenWidth - 40)/2)
    .autoHeightRatio(0);
    [shiYongCiShuLabel setMaxNumberOfLinesToShow:1];
    
    yiShiYongCiShuLabel.sd_layout
    .rightSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,15)
    .widthIs((ScreenWidth - 40)/2)
    .autoHeightRatio(0);
    [yiShiYongCiShuLabel setMaxNumberOfLinesToShow:1];
    
    lianjieSwitch.sd_layout
    .rightSpaceToView(self.contentView,20)
    .centerYEqualToView(self.contentView)
    .widthIs(150)
    .heightRatioToView(nameLabe1,1);
    
    lianJieStateLabel.sd_layout
    .rightSpaceToView(lianjieSwitch,5)
    .centerYEqualToView(self.contentView)
    .widthIs(70)
    .heightRatioToView(nameLabe1,1);
    
//    useStateLabel.sd_layout
//    .leftEqualToView(lianJieStateLabel)
//    .centerYEqualToView(shiYongCiShuLabel)
//    .rightEqualToView(lianjieSwitch)
//    .heightRatioToView(lianJieStateLabel,1);
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
    
}

- (void)setModel:(ModelDeviceListChild *)model
{
    _model = model;
    
    self.nameLabe1.text = model.device.name;
    self.shiYongCiShuLabel.text = [NSString stringWithFormat:@"剩余次数：%@",model.device.currentCount];
    self.yiShiYongCiShuLabel.text = [NSString stringWithFormat:@"已用次数：%@",model.device.usedCount];
}

- (void)didLianjie:(UISwitch *)lianjieSwitch
{
    if (self.lianjieBlock) {
        self.lianjieBlock(lianjieSwitch.on);
    }
}

//- (void)setModel:(ModelDevice *)model
//{
//    _model = model;
//    
//    self.nameLabe1.text = model.name;
//    self.shiYongCiShuLabel.text = [NSString stringWithFormat:@"剩余次数：%@",model.currentCount];
//}

@end
