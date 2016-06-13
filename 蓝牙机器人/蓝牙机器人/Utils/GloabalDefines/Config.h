//
//  Config.h
//  YouChengTire
//
//  Created by WangZhipeng on 15/12/9.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define SERVER_URL       @"http://121.43.104.42:8080"
//#define SERVER_URL       @"http://192.168.1.120:8080"

#define URLSTR(urlStr)   [NSString stringWithFormat:@"%@/machine%@",SERVER_URL,urlStr]
#define URLSTR2(urlStr)  [NSString stringWithFormat:@"%@%@",SERVER_URL,urlStr]


#endif /* Config_h */
