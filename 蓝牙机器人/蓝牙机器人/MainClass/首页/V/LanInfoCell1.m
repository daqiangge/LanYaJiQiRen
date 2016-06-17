//
//  LanInfoCell1.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LanInfoCell1.h"

@implementation LanInfoCell1


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LanInfoCell1 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LanInfoCell1";
    LanInfoCell1 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LanInfoCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor blackColor];
    label1.text = @"机器人编号：";
    [self.contentView addSubview:label1];
    self.label1 = label1;
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor grayColor];
    label2.text = @"机器人1号";
    [self.contentView addSubview:label2];
    self.label2 = label2;
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self.contentView addSubview:lineView];
    
    label1.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,0)
    .widthIs(120)
    .bottomSpaceToView(self.contentView,0);
    
    label2.sd_layout
    .leftSpaceToView(label1,10)
    .topSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,15)
    .bottomSpaceToView(self.contentView,0);
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
}

@end
