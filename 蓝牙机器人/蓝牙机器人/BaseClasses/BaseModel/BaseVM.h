//
//  BaseVM.h
//  YouChengTire
//
//  Created by WangZhipeng on 15/12/9.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#import <Foundation/Foundation.h>
// Tools
#import "ZPEncrypt.h"
// Models
#import "ModelMember.h"

@interface BaseVM : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSMutableArray *mArray;
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, weak) UIViewController *masterVC;

- (void)initialize;

/**
 * 创建AppKey
 */
+ (NSString *)createAppKey:(NSDictionary *)dictionary;

@end
