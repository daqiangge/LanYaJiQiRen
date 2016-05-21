//
//  UIButton+LQCategory.m
//  lingdaozhe
//
//  Created by liqiang on 16/4/26.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "UIButton+LQCategory.h"

@implementation UIButton (LQCategory)

+ (UIButton *)createButtonWithTitle:(NSString *)title titleColor:(UIColor *)color titleLabelFont:(UIFont *)titleLabelFont addTarget:(nullable id)target action:(SEL)action
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = titleLabelFont;
    return btn;
}

@end
