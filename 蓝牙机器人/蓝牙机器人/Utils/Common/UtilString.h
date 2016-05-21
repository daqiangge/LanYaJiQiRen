//
//  UtilString.h
//  lingdaozhe
//
//  Created by liqiang on 16/4/20.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilString : NSObject

/**
 *  判断是否为空字符串
 */
+ (NSString *)getNoNilString:(NSString *)str;
+ (NSString *)documentsPath:(NSString *)fileName;
@end
