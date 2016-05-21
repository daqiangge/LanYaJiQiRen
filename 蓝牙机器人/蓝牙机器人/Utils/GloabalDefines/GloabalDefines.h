//
//  GloabalDefines.h
//  我的框架
//
//  Created by liqiang on 16/3/24.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#ifndef GloabalDefines_h
#define GloabalDefines_h

#define Window [[UIApplication sharedApplication].delegate window]

//主要单例
#define UserDefaults                        [NSUserDefaults standardUserDefaults]
#define NotificationCenter                  [NSNotificationCenter defaultCenter]
#define SharedApplication                   [UIApplication sharedApplication]

//  大小尺寸
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        ([[UIScreen mainScreen] bounds].size.height-64)


//间距
#define SPACEING_5  5
#define SPACEING_10 10
#define SPACEING_15 15
#define SPACEING_20 20
#define SPACEING_25 25
#define SPACEING_30 30

//按钮的tag起始值
#define Button_InitialTag    100
//TextField的tag起始值
#define TextField_InitialTag 200
//TextView的tag起始值
#define TextView_InitialTag  300

//颜色
#define LQRGBColor(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]

//hex颜色
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

//全局文字颜色
#define Global_tintColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]

//font
#define SYSTEM_FONT_(x)                    [UIFont systemFontOfSize:x]
#define SYSTEM_FONT_BOLD_(a)               [UIFont boldSystemFontOfSize:a]

#define FONT_TEXTSIZE_VerySmall   SYSTEM_FONT_(10)//特小（图标配字）
#define FONT_TEXTSIZE_Small       SYSTEM_FONT_(12)//小号（特别提示，如时间，地点）
#define FONT_TEXTSIZE_Mid         SYSTEM_FONT_(14)//中号（内容区摘要记录、正文、提示）
#define FONT_TEXTSIZE_Big         SYSTEM_FONT_(16)//大号（内容区标题、人名、模块入口、按钮）
#define FONT_TEXTSIZE_VeryBig     SYSTEM_FONT_(18)//特大号（导航栏Head标题）

#define COLOR_White           HEXCOLOR(0xffffff)//白(多用于按钮上)
#define COLOR_Black           HEXCOLOR(0x333333)//黑（标题、正文）
#define COLOR_Gray            HEXCOLOR(0x999999)//灰（辅助文字）
#define COLOR_darkGray        HEXCOLOR(0x666666)//深灰（提示文字）
#define COLOR_LightGray       HEXCOLOR(0xc7c7cd)//浅灰（输入提示文字）
#define COLOR_Orange          HEXCOLOR(0xff9900)//橙（金额）
#define COLOR_Red             HEXCOLOR(0xf43530)//红（提醒文字）
#define COLOR_OrangeRed       HEXCOLOR(0xff5c0b)//橙红
#define COLOR_Green           HEXCOLOR(0x4eca83)//绿色
#define COLOR_Blue            HEXCOLOR(0x6586C8)//蓝色


#define COLOR_ButtonBackGround_Red    HEXCOLOR(0xec5050)
#define COLOR_ButtonBackGround_Green  HEXCOLOR(0x06bf04)
#define COLOR_ButtonBackGround_White  HEXCOLOR(0xffffff)
#define COLOR_ButtonBackGround_Gray   HEXCOLOR(0xe1e1e1)


#define COLOR_LineViewColor           HEXCOLOR(0xd9d9d9)  //浅灰
#define COLOR_BackgroundColor         HEXCOLOR(0xeeeeee)  //米白
#define NAV_BAR_COLOR                 HEXCOLOR(0xffffff)  //HEXCOLOR(0xfe630f) 纯白

#define SizeScale(s) ([[UIScreen mainScreen] bounds].size.height > 568 ?  ([[UIScreen mainScreen] bounds].size.height / 568.0 * (s)) : (s * 1.0))

#define AppDel_whole        ((AppDelegate *)[UIApplication sharedApplication].delegate)

//下载成功通知
#define NOTIFICATION_VideoDownloadSuccess            @"NOTIFICATION_VideoDownloadSuccess"
//课程购买成功
#define NOTIFICATION_LessonsPaySuccess               @"NOTIFICATION_VideoPaySuccess"
//查询微信支付结果
#define NOTIFICATION_ViewWxpayResult                 @"NOTIFICATION_ViewWxpayResult"

#endif
