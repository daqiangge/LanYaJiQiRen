//
//  LanInfoVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/26.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LanInfoVC.h"
#import "LanInfoCell1.h"
#import "LanInfoCell2.h"
#import "LanInfoCell3.h"

@interface LanInfoVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation LanInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"授权使用";
    
    [self drawView];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    //    tableView.tableFooterView = [self drawFooterView];
    [self.view addSubview:tableView];
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
    UIButton *logOutBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 345, ScreenWidth-30, 40)];
    [logOutBtn setTitle:@"确定" forState:UIControlStateNormal];
    [logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    logOutBtn.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
    logOutBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [logOutBtn addTarget:self action:@selector(ensure) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:logOutBtn];
}

- (void)ensure
{
    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"授权成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alter show];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            LanInfoCell1 *cell = [LanInfoCell1 cellWithTableView:tableView];
            cell.label1.text = @"机器人编号：";
            cell.label2.text = @"机器人1号";
            return cell;
        }
            break;
        case 1:
        {
            LanInfoCell1 *cell = [LanInfoCell1 cellWithTableView:tableView];
            cell.label1.text = @"可用次数：";
            cell.label2.text = @"100";
            return cell;
        }
            break;
        case 2:
        {
            LanInfoCell1 *cell = [LanInfoCell1 cellWithTableView:tableView];
            cell.label1.text = @"连接状态：";
            cell.label2.text = @"已连接";
            return cell;
        }
            break;
        case 3:
        {
            LanInfoCell1 *cell = [LanInfoCell1 cellWithTableView:tableView];
            cell.label1.text = @"可授权次数：";
            cell.label2.text = @"1000";
            return cell;
        }
            break;
        case 4:
        {
            LanInfoCell2 *cell = [LanInfoCell2 cellWithTableView:tableView];
            return cell;
        }
            break;
        case 5:
        {
            LanInfoCell3 *cell = [LanInfoCell3 cellWithTableView:tableView];
            return cell;
        }
            break;
            
        default:
            break;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 5) {
        return 80;
    }
    
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}


@end
