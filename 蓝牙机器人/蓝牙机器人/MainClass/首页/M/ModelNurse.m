//
//  ModelNurse.m
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelNurse.h"

static ModelNurse *shareSingleTon = nil;

@implementation ModelNurse

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareSingleTon = [[ModelNurse alloc] init];
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

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"_id":@"id"};
}

@end
