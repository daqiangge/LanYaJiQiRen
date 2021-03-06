//
//  ModelDeviceAndNurse.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ModelNurse;

@interface ModelDeviceAndNurse : NSObject

@property (nonatomic, strong) NSArray *deviceList;
@property (nonatomic, strong) ModelNurse *nurse;
@property (nonatomic, strong) NSArray *phoneList;


+ (instancetype)sharedManager;

@end

@interface ModelPhone : NSObject

@property (nonatomic, strong) NSString *phone;

@end
