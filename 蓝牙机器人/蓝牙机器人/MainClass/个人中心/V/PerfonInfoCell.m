//
//  PerfonInfoCell.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PerfonInfoCell.h"

@interface PerfonInfoCell()

@end

@implementation PerfonInfoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (PerfonInfoCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"PerfonInfoCell";
    PerfonInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[PerfonInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"用户名";
    [self.contentView addSubview:label];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"用户名";
    textField.text = @"张三";
    [self.contentView addSubview:textField];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = COLOR_LineViewColor;
    [self.contentView addSubview:lineView];
    
    label.sd_layout
    .leftSpaceToView(self.contentView,15)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .widthIs(100);
    
    textField.sd_layout
    .leftSpaceToView(label,10)
    .centerYEqualToView(self.contentView)
    .heightIs(40)
    .rightSpaceToView(self.contentView,15);
    
    lineView.sd_layout
    .leftSpaceToView(self.contentView,0)
    .bottomSpaceToView(self.contentView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(0.5);
    
}

@end
