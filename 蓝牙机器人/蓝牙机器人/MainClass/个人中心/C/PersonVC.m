//
//  PersonVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PersonVC.h"
#import "LogInCell.h"
#import "LoginVC.h"
#import "ChangePasswordVC.h"
#import "AboutUsVC.h"
#import "FanKuiVC.h"
#import "PersonInfoVC.h"

@interface PersonVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation PersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人中心";
    
    [self drawView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
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
    if (indexPath.row == 0)
    {
        LogInCell *cell = [LogInCell cellWithTableView:tableView];
        return cell;
    }
    
    NSArray *array = @[@"个人资料",@"修改密码",@"关于我们",@"客服中心",@"意见反馈"];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = array[indexPath.row - 1];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
    cell.imageView.image = [UIImage imageNamed:@"person"];
    
    if (indexPath.row == 4)
    {
        cell.detailTextLabel.text = @"400-400-8888";
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 80;
    }
    
    return 38.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0)
    {
        LoginVC *loginVC = [[LoginVC alloc] init];
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:loginVC];
        [self presentViewController:nav1 animated:NO completion:nil];
    }else if (indexPath.row == 1){
        PersonInfoVC *vc = [[PersonInfoVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        ChangePasswordVC *vc = [[ChangePasswordVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        AboutUsVC *vc = [[AboutUsVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        FanKuiVC *vc = [[FanKuiVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
