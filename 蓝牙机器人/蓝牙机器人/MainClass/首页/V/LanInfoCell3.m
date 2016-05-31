//
//  LanInfoCell3.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LanInfoCell3.h"

@implementation LanInfoCell3


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (LanInfoCell3 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"LanInfoCell3";
    LanInfoCell3 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[LanInfoCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor redColor];
    label1.text = @"注：\n      授权次数大于0，则表示授权使用次数。\n      授权次数小于0，则表示回收使用次数。";
    [self.contentView addSubview:label1];
    
    label1.sd_layout
    .leftSpaceToView(self.contentView,15)
    .topSpaceToView(self.contentView,15)
    .rightSpaceToView(self.contentView,0)
    .autoHeightRatio(0);
}

@end
