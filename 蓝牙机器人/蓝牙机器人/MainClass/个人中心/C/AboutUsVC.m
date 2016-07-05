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
    label.text = @"    无锡安之卓医疗机器人有限公司地处无锡市惠山经开区，占地60亩，建有5500平米办公楼及16000平米生产车间。公司是一家国际领先的提供医疗行业机器换人解决方案的大型设备供应商。我公司具有前沿的技术研发能力、强大的资源体系、先进的管理理念、完善的售后服务，致力于为医院提供自动化医疗设备及整体解决方案。\n    公司产品的长远发展方向是把机器人技术用于医疗的各个领域，并把机器人智能化作为核心竞争力。 \"发展先进医疗工业自动化技术，造福中国人民和世界各国人民\"是公司的发展动力。公司立足中国，放眼世界。将通过引进国际国内技术专家，与国内外著名医院和高校实验室合作，把公司建设成国际一流医疗自动化公司，开发出国际一流医疗机器人。\n    公司企业文化是:人才、思考、勤奋、创新。励志把公司建成全体员工大家庭。";
    [self.view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(self.view,15)
    .topSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .autoHeightRatio(0);
}

@end
