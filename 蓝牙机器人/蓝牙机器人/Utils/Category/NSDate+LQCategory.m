//
//  NSDate+LQCategory.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/27.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "NSDate+LQCategory.h"

@implementation NSDate (LQCategory)

/**
 *  秒转分返回string类型
 */
+ (NSString*)TimeformatFromSeconds:(long)seconds
{
    long hour = seconds/7200;
    long minute = (seconds%3600)/60;
    long second = seconds%60;
    
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",hour];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",minute];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",second];
    //format of time
    
    NSString *format_time;
    
    if (hour)
    {
        format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    }
    else
    {
        format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    }
    
    return format_time;
}

/**
 *  时戳转string
 *
 *  @param timeFormatStr 时间格式
 *  @param time          时戳
 */
+ (NSString *)dateWithTimeStamp:(long long)timeStamp dateFormat:(NSString *)dateFormat
{
    if (!dateFormat.length)
    {
        dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    
    NSDate *detaildate = [NSDate dateWithTimeIntervalInMilliSecondSince1970:timeStamp];
    return [NSDate dateStringWithTimeDate:detaildate dateFormat:dateFormat];
}

/**
 *  NSDate转string
 *
 *  @param timeDate   date
 *  @param dateFormat 时间格式
 *
 *  @return
 */
+ (NSString *)dateStringWithTimeDate:(NSDate *)timeDate dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: timeDate];
    
    return currentDateStr;
    
}

/**
 *  时戳转NSDate
 *
 *  @param timeIntervalInMilliSecond 时戳
 */
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond
{
    NSDate *ret = nil;
    double timeInterval = timeIntervalInMilliSecond;
    // judge if the argument is in secconds(for former data structure).
    if(timeIntervalInMilliSecond > 140000000000) {
        timeInterval = timeIntervalInMilliSecond / 1000;
    }
    ret = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    return ret;
}

@end
