//
//  UIAlertView+LQAlertView.h
//  微信支付自付宝支付封装
//
//  Created by liqiang on 16/3/24.
//  Copyright © 2016年 Liqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();

@interface UIAlertView (LQAlertView)

+ (void)showNilDelegateAlertViewWithTitle:(NSString *)title theMessage:(NSString *)message;

//方法定义
+ (UIAlertView *)showAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSArray*)otherButtons
                              onDismiss:(DismissBlock)dismissed
                               onCancel:(CancelBlock)cancelled;

@end
