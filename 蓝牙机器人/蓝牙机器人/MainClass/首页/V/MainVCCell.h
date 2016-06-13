//
//  MainVCCell.h
//  蓝牙机器人
//
//  Created by liqiang on 16/5/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelDeviceListChild.h"

typedef void(^LianjieBlock)(BOOL isOn);

@interface MainVCCell : UITableViewCell

@property (nonatomic, copy) LianjieBlock lianjieBlock;

@property (nonatomic, strong) ModelDeviceListChild *model;

//@property (nonatomic, strong) ModelDevice *model;

@property (nonatomic, weak) UISwitch *lianjieSwitch;

+ (MainVCCell *)cellWithTableView:(UITableView *)tableView;

@end
