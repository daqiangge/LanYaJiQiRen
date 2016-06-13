//
//  ModelDeviceListChild.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelDevice.h"
#import "ModelHospital.h"

@class ModelHospital;

@interface ModelDeviceListChild : NSObject

@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *currentCount;
@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *usedCount;
@property (nonatomic, strong) ModelHospital *hospital;
@property (nonatomic, strong) ModelDevice *device;
@property (nonatomic, copy) NSString *number;

@end
