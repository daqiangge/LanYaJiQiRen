//
//  MainVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "MainVC.h"
#import "MainVCCell.h"
#import "PersonVC.h"

@interface MainVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableViwe;
@property (nonatomic, weak) UILabel *yiYuanNameLabel;
@property (nonatomic, weak) UILabel *guanLiYuanNameLabel;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"医疗机器人";
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableViwe = tableView;
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"person"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoPersonVC)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}

- (void)gotoPersonVC
{
    PersonVC *vc = [[PersonVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainVCCell *cell = [MainVCCell cellWithTableView:tableView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 125;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 125)];
    headerView.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    
    UIView *yiyuanView = [[UIView alloc] init];
    yiyuanView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:yiyuanView];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textColor = [UIColor blackColor];
    label1.text = @"医院名称";
    [yiyuanView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.font = [UIFont systemFontOfSize:15];
    label2.textColor = [UIColor blackColor];
    label2.text = @"管理员";
    [yiyuanView addSubview:label2];
    
    UILabel *yiYuanNameLabel = [[UILabel alloc] init];
    yiYuanNameLabel.font = [UIFont systemFontOfSize:15];
    yiYuanNameLabel.textColor = [UIColor grayColor];
    yiYuanNameLabel.text = @"无锡市第101医院";
    [yiyuanView addSubview:yiYuanNameLabel];
    self.yiYuanNameLabel = yiYuanNameLabel;
    
    UILabel *guanLiYuanNameLabel = [[UILabel alloc] init];
    guanLiYuanNameLabel.font = [UIFont systemFontOfSize:15];
    guanLiYuanNameLabel.textColor = [UIColor grayColor];
    guanLiYuanNameLabel.text = @"张三";
    [yiyuanView addSubview:guanLiYuanNameLabel];
    self.guanLiYuanNameLabel = guanLiYuanNameLabel;
    
    UIView *lieBiaoTitleView = [[UIView alloc] init];
    lieBiaoTitleView.backgroundColor = [UIColor colorWithRed:0.227 green:0.714 blue:0.855 alpha:1.00];
    [headerView addSubview:lieBiaoTitleView];
    
    UILabel *lieBiaoTitleLabel = [[UILabel alloc] init];
    lieBiaoTitleLabel.font = [UIFont systemFontOfSize:18];
    lieBiaoTitleLabel.textColor = [UIColor whiteColor];
    lieBiaoTitleLabel.text = @"设备列表";
    lieBiaoTitleLabel.textAlignment = NSTextAlignmentCenter;
    lieBiaoTitleLabel.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
    [lieBiaoTitleView addSubview:lieBiaoTitleLabel];
    
    yiyuanView.sd_layout
    .leftSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .topSpaceToView(headerView,0)
    .heightIs(75);
    
    label1.sd_layout
    .leftSpaceToView(yiyuanView,15)
    .topSpaceToView(yiyuanView,0)
    .widthIs(80)
    .heightIs(37.5);
    
    label2.sd_layout
    .leftSpaceToView(yiyuanView,15)
    .topSpaceToView(label1,0)
    .widthIs(80)
    .heightIs(37.5);
    
    yiYuanNameLabel.sd_layout
    .leftSpaceToView(label1,15)
    .topEqualToView(label1)
    .rightSpaceToView(yiyuanView,15)
    .heightRatioToView(label1,1);
    
    guanLiYuanNameLabel.sd_layout
    .leftSpaceToView(label2,15)
    .topEqualToView(label2)
    .rightSpaceToView(yiyuanView,15)
    .heightRatioToView(label2,1);
    
    lieBiaoTitleView.sd_layout
    .leftSpaceToView(headerView,0)
    .bottomSpaceToView(headerView,0)
    .rightSpaceToView(headerView,0)
    .heightIs(40);
    
    lieBiaoTitleLabel.sd_layout
    .centerXEqualToView(lieBiaoTitleView)
    .bottomSpaceToView(lieBiaoTitleView,0)
    .topSpaceToView(lieBiaoTitleView,0)
    .widthIs(190);
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
