//
//  NSString+LQCategory.h
//  lingdaozhe
//
//  Created by liqiang on 16/5/23.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LQCategory)

/**
 *  字典转字符串
 */
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 *  计算文本的size
 */
- (CGSize)LQ_calculateStringSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

/**
 *  判断字符串是否为整型
 */
- (BOOL)LQ_isPureInt;

/**
 *  判断字符串是否为浮点型
 */
- (BOOL)LQ_isPureFloat;


/**
 *  判断字符串是否为纯数字
 */
- (BOOL)LQ_isAllNum;

@end
