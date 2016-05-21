//
//  NSDate+LQCategory.h
//  lingdaozhe
//
//  Created by liqiang on 16/4/27.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LQCategory)

/**
 *  秒转分返回string类型
 */
+ (NSString*)TimeformatFromSeconds:(long)seconds;

/**
 *  时戳转string
 *
 *  @param timeFormatStr 时间格式
 *  @param time          时戳
 */
+ (NSString *)dateWithTimeStamp:(long long)timeStamp dateFormat:(NSString *)dateFormat;

/**
 *  NSDate转string
 *
 *  @param timeDate   date
 *  @param dateFormat 时间格式
 *
 *  @return
 */
+ (NSString *)dateStringWithTimeDate:(NSDate *)timeDate dateFormat:(NSString *)dateFormat;

/**
 *  时戳转NSDate
 *
 *  @param timeIntervalInMilliSecond 时戳
 */
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;

@end
