//
//  BaseView.m
//  WaterMan
//
//  Created by 陈梦悦 on 15-11-3.
//  Copyright (c) 2015年 baichun. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=COLOR_BackgroundColor;
    }
    return self;
}

@end
