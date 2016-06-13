//
//  NSData+LQCategory.h
//  蓝牙机器人
//
//  Created by liqiang on 16/6/8.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (LQCategory)

/**
 *  CRC8校验
 */
- (unsigned short)crc8;

/**
 *  int转NSData
 */
+ (NSData *)get4ByteWithId:(int)Id;

/**
 *  int转1字节NSData
 */
+ (NSData *)get1ByteWithId:(int)Id;

@end
