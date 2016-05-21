//
//  UIButton+LQCategory.h
//  lingdaozhe
//
//  Created by liqiang on 16/4/26.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LQCategory)

+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color titleLabelFont:(UIFont *)titleLabelFont addTarget:(nullable id)target action:(SEL)action;

@end
