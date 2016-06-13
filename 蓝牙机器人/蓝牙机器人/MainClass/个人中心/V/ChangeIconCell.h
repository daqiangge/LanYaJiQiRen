//
//  ChangeIconCell.h
//  蓝牙机器人
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeIconCell : UITableViewCell

@property (nonatomic, strong) UIImage *iconImage;

@property (nonatomic, copy) NSString *imageUrlStr;

+ (ChangeIconCell *)cellWithTableView:(UITableView *)tableView;

@end
