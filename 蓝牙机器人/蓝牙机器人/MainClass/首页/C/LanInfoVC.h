//
//  LanInfoVC.h
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ChildBaseViewController.h"
#import "ModelDeviceListChild.h"
#import "SerialGATT.h"

#define WARNING_MESSAGE @"z"

typedef enum : NSUInteger {
    CMD1,
    CMD2,
    CMD3,
} CMD;

@class CBPeripheral;
@class SerialGATT;

@interface LanInfoVC : ChildBaseViewController<BTSmartSensorDelegate>

@property (strong, nonatomic) CBPeripheral *peripheral;
@property (strong, nonatomic) SerialGATT *sensor;


@property (nonatomic, strong) ModelDeviceListChild *model;

@end
