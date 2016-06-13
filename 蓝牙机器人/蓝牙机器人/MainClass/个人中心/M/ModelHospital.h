//
//  ModelHospital.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelHospital : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *contact;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *currentCount;
@property (nonatomic, copy) NSString *usedCount;

@end
