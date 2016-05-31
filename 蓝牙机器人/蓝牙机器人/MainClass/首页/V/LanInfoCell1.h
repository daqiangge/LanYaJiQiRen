//
//  LanInfoCell1.h
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanInfoCell1 : UITableViewCell

@property (nonatomic, weak) UILabel *label1;
@property (nonatomic, weak) UILabel *label2;

+ (LanInfoCell1 *)cellWithTableView:(UITableView *)tableView;

@end
