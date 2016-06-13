//
//  ModelDevice.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CBPeripheral;

@interface ModelDevice : NSObject

@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *currentCount;
@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *usedCount;
@property (nonatomic, copy) NSString *btNumber;

@property (nonatomic, strong) CBPeripheral *peripheral;

@end
