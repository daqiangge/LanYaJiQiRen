//
//  ModelDeviceAndNurse.m
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelDeviceAndNurse.h"

static ModelDeviceAndNurse *shareSingleTon = nil;

@implementation ModelDeviceAndNurse

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareSingleTon = [[ModelDeviceAndNurse alloc] init];
    });
    return shareSingleTon;
}

//限制当前对象创建多实例
#pragma mark - sengleton setting
+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (shareSingleTon == nil) {
            shareSingleTon = [super allocWithZone:zone];
        }
    }
    return shareSingleTon;
}

+ (id)copyWithZone:(NSZone *)zone {
    return self;
}

+ (NSDictionary *)objectClassInArray
{
    return @{@"deviceList":@"ModelDeviceListChild",@"phoneList":@"ModelPhone"};
}

@end

@implementation ModelPhone

@end
