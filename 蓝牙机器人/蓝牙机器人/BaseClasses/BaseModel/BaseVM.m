//
//  BaseVM.m
//  YouChengTire
//
//  Created by WangZhipeng on 15/12/9.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import "BaseVM.h"

@interface BaseVM ()

@end

@implementation BaseVM

- (instancetype)init {
    if(self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {}

/**
 * 创建AppKey
 */
+ (NSString *)createAppKey:(NSDictionary *)dictionary {
    NSArray *valueArray = dictionary.allValues;
    valueArray = [valueArray sortedArrayUsingSelector:@selector(compare:)];
    ModelMember *userM = [ModelMember sharedManager];
    NSMutableString *compare = @"".mutableCopy;
    for (NSString *string in valueArray) {
        [compare appendString:string];
    }
    [compare appendString:userM._id];
    return [NSString stringWithFormat:@"%@%@", userM._id, [compare encryptSHA1]];
}

@end
