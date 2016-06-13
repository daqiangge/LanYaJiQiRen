//
//  LanInfoCell2.h
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanInfoCell2 : UITableViewCell

@property (nonatomic, weak) UITextField *textField;

+ (LanInfoCell2 *)cellWithTableView:(UITableView *)tableView;

@end
