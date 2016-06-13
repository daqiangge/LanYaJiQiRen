//
//  NSString+LQCategory.m
//  lingdaozhe
//
//  Created by liqiang on 16/5/23.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "NSString+LQCategory.h"

@implementation NSString (LQCategory)


+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

/**
 *  计算文本的size
 */
- (CGSize)LQ_calculateStringSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    CGSize size = [self boundingRectWithSize:maxSize options: NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return size;
}

/**
 *  判断字符串是否为纯数字
 */
- (BOOL)LQ_isAllNum
{
    unichar c;
    for (int i=0; i<self.length; i++)
    {
        c = [self characterAtIndex:i];
        if (!isdigit(c))
        {
            return NO;
        }
    }
    return YES;
}

/**
 *  判断字符串是否为整型
 */
- (BOOL)LQ_isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    long long val;
    return [scan scanLongLong:&val] && [scan isAtEnd];
}

/**
 *  判断字符串是否为浮点型
 */
- (BOOL)LQ_isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

@end
