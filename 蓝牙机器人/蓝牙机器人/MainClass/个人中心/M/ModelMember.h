//
//  ModelMember.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelNurse.h"

@interface ModelMember : NSObject

@property (nonatomic, copy) NSString *_id;
@property (nonatomic, copy) NSString *createDate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, copy) NSString *photo;


+ (instancetype)sharedManager;
+ (void)updataModelMemberWithModel:(ModelMember *)model;
- (void)logOut;


@end
