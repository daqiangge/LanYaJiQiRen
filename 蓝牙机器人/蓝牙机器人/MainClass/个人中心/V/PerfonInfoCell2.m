//
//  PerfonInfoCell2.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PerfonInfoCell2.h"

@implementation PerfonInfoCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self drawView];
    }
    
    return self;
}

+ (PerfonInfoCell2 *)cellWithTableView:(UITableView *)tableView
{
    static NSString *idenifier = @"PerfonInfoCell2";
    PerfonInfoCell2 *cell = [tableView dequeueReusableCellWithIdentifier:idenifier];
    if (cell == nil)
    {
        cell = [[PerfonInfoCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"联系电话";
    [self.contentView addSubview:label];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.font = [UIFont systemFontOfSize:15];
    textField.placeholder = @"联系电话";
    textField.text = [UserDefaults valueForKey:@"username"];
    textField.enabled = NO;
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
