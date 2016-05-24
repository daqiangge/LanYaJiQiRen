//
//  AboutUsVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "AboutUsVC.h"

@interface AboutUsVC ()

@end

@implementation AboutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"关于我们";
    self.view.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    
    [self drawView];
}

- (void)drawView
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    label.text = @"医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人医疗机器人";
    [self.view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(self.view,15)
    .topSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .autoHeightRatio(0);
}

@end
