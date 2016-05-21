//
//  Config.h
//  YouChengTire
//
//  Created by WangZhipeng on 15/12/9.
//  Copyright © 2015年 WangZhipeng. All rights reserved.
//

#ifndef Config_h
#define Config_h


//#define SERVER_URL                 @"http://121.42.194.54:8788/ldzapiprj/webService"
//#define VIDEO_DOWNLOAD_BASEURL     @"http://imgcdn.waterfu.com.cn/sfaudio"
//#define VIDEO_DOWNLOAD_URL(urlStr) [NSString stringWithFormat:@"%@%@",VIDEO_DOWNLOAD_BASEURL,urlStr]
//
//#define WeiXinCallBack             @"http://121.42.194.54:8123/ldzprj/wxpayCourseSuccess.action";
//#define AliPayCallBack             @"http://121.42.194.54:8123/ldzprj/alipayCourseSuccess.action";
//#define DELEGATE_URL               @"http://121.42.194.54:8123/protocol.html"

#define SERVER_URL                 @"http://121.42.194.54:8788/ldzapiprj/webService"
#define VIDEO_DOWNLOAD_BASEURL     @"http://imgcdn.waterfu.com.cn/sfaudio"
#define VIDEO_DOWNLOAD_URL(urlStr) [NSString stringWithFormat:@"%@%@",VIDEO_DOWNLOAD_BASEURL,urlStr]

#define WeiXinCallBack             @"http://121.42.194.54:8788/ldzprj/wxpayCourseSuccess.action";
#define AliPayCallBack             @"http://121.42.194.54:8788/ldzprj/alipayCourseSuccess.action";
#define DELEGATE_URL               @"http://121.42.194.54:8788/protocol.html"

#define Audion_Url                 @"http://imgcdn.waterfu.com.cn/sfaudio"
#define IMAGES_OSS_PIC             @"http://imgcdn.waterfu.com.cn/sfpic"
#define IMAGES_ICON_BIG            @"http://imgcdn.waterfu.com.cn/sfpic"
#define IMAGES_ICON_SAMLL          @"http://imgcdn.waterfu.com.cn/sfpic"
#define IMAGE_URL(urlStr)          [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",IMAGES_OSS_PIC,urlStr]]


#define YOUKU_ClientId             @"a13ae54dd54c26af"
#define YOUKU_ClientSecret         @"12ed53c452276d85baf17ac74d19d8e6"


#define APPKEY_WECHAT      @"wx922a3bdb8fcb29de"
#define APPSECRET_WECHAT   @"d4624c36b6795d1d99dcf0547af5443d"
#define WECHAT_ZF_SHOPID   @"1288983601"
#define WECHAT_ZF_Key      @"F8BCD4B682AF62B17F1C2C043D17BD05"


#endif /* Config_h */
