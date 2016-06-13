//
//  ModelMember.m
//  蓝牙机器人
//
//  Created by liqiang on 16/6/5.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "ModelMember.h"
#import "ModelHospital.h"

//static NSString *const loginInfo = @"user";

@implementation ModelMember

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static ModelMember *shareSingleTon = nil;
    dispatch_once(&onceToken, ^{
        shareSingleTon = [[ModelMember alloc] init];
    });
    return shareSingleTon;
}

+ (void)updataModelMemberWithModel:(ModelMember *)model
{
    ModelMember *modelMember = [ModelMember sharedManager];
    
    modelMember._id = model._id;
    modelMember.createDate = model.createDate;
    modelMember.name = model.name;
    modelMember.mobile = model.mobile;
    modelMember.photo = model.photo;
    
    [UserDefaults setValue:modelMember.mj_keyValues forKey:@"USER"];
    [UserDefaults synchronize];
}

- (void)logOut
{
    [UserDefaults setValue:@"" forKey:@"USER"];
    [UserDefaults synchronize];
}


+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"_id":@"id"};
}

@end
