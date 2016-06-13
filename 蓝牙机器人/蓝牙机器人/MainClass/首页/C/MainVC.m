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
#import "LanInfoVC.h"

#import "ModelNurse.h"
#import "ModelDevice.h"
#import "ModelDeviceListChild.h"
#import "ModelDeviceAndNurse.h"




@interface MainVC ()<UITableViewDelegate,UITableViewDataSource,BTSmartSensorDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UILabel *yiYuanNameLabel;
@property (nonatomic, weak) UILabel *guanLiYuanNameLabel;
@property (nonatomic, weak) UILabel *shouquanNumLabel;

@property (strong, nonatomic) SerialGATT *sensor;

//临时的数据
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *peripheralArray;

@end

@implementation MainVC

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
    return _dataArray;
}

- (NSMutableArray *)peripheralArray
{
    if (!_peripheralArray) {
        _peripheralArray = [NSMutableArray array];
    }
    
    return _peripheralArray;
}

//============================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"医疗机器人";
    
    [self drawView];
    
    self.sensor = [[SerialGATT alloc] init];
    [self.sensor setup];
    self.sensor.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self.sensor activePeripheral])
    {
        if (self.sensor.activePeripheral.state == CBPeripheralStateConnected) {
            [self.sensor.manager cancelPeripheralConnection:self.sensor.activePeripheral];
            self.sensor.activePeripheral = nil;
        }
    }
    
    if ([self.sensor peripherals])
    {
        self.sensor.peripherals = nil;
        [self.dataArray removeAllObjects];
        [self.tableView reloadData];
    }
    
    self.sensor.delegate = self;
    
    [self.sensor findHMSoftPeripherals:5];
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"person"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoPersonVC)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}

- (void)gotoPersonVC
{
    PersonVC *vc = [[PersonVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  蓝牙连接
 */
- (void)lanYaLianJieWitnSwitchIsOn:(BOOL)isOn indexPathRow:(NSInteger)row
{
    
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray.count;
    
//    if ([ModelDeviceAndNurse sharedManager].deviceList.count)
//    {
//        return [ModelDeviceAndNurse sharedManager].deviceList.count;
//    }else{
//        return 0;
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainVCCell *cell = [MainVCCell cellWithTableView:tableView];
    
//    cell.model = [ModelDeviceAndNurse sharedManager].deviceList[indexPath.row];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 162.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 162.5)];
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
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.font = [UIFont systemFontOfSize:15];
    label3.textColor = [UIColor blackColor];
    label3.text = @"可授权次数";
    [yiyuanView addSubview:label3];
    
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
    
    UILabel *shouquanNumLabel = [[UILabel alloc] init];
    shouquanNumLabel.font = [UIFont systemFontOfSize:15];
    shouquanNumLabel.textColor = [UIColor grayColor];
    shouquanNumLabel.text = @"1000次";
    [yiyuanView addSubview:shouquanNumLabel];
    self.shouquanNumLabel = shouquanNumLabel;
    
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
    .heightIs(112.5);
    
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
    
    label3.sd_layout
    .leftSpaceToView(yiyuanView,15)
    .topSpaceToView(label2,0)
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
    
    shouquanNumLabel.sd_layout
    .leftSpaceToView(label3,15)
    .topEqualToView(label3)
    .rightSpaceToView(yiyuanView,15)
    .heightRatioToView(label3,1);
    
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
    
    if ([ModelDeviceAndNurse sharedManager].nurse)
    {
        yiYuanNameLabel.text = [ModelDeviceAndNurse sharedManager].nurse.hospital.name;
        guanLiYuanNameLabel.text = [ModelDeviceAndNurse sharedManager].nurse.name;
        shouquanNumLabel.text = [ModelDeviceAndNurse sharedManager].nurse.hospital.currentCount;
    }
    
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ModelDeviceListChild *model = self.dataArray[indexPath.row];
    
    LanInfoVC *controller = [[LanInfoVC alloc] init];
    controller.peripheral = model.device.peripheral;
    controller.sensor = self.sensor;
    controller.model = model;
    
    if (self.sensor.activePeripheral && self.sensor.activePeripheral != controller.peripheral)
    {
        [self.sensor disconnect:self.sensor.activePeripheral];
    }
    
    self.sensor.activePeripheral = model.device.peripheral;
    [self.sensor connect:self.sensor.activePeripheral];
    [self.sensor stopScan];
    
    [self.navigationController pushViewController:controller animated:YES];
    
}


#pragma mark - HMSoftSensorDelegate
-(void)sensorReady
{
    //TODO: it seems useless right now.
}

-(void)peripheralFound:(CBPeripheral *)peripheral
{
    NSLog(@"--->%@",peripheral.name);
    [self.dataArray removeAllObjects];
    for (ModelDeviceListChild *model in [ModelDeviceAndNurse sharedManager].deviceList)
    {
        if ([[NSString stringWithFormat:@"%@",model.device.btNumber] isEqualToString:peripheral.name])
        {
            model.device.peripheral = peripheral;
            [self.dataArray addObject:model];
        }
    }
    
//    ModelDevice *model1 = [[ModelDevice alloc] init];
//    model1 .name = peripheral.name;
//    ModelDeviceListChild *mode2 = [[ModelDeviceListChild alloc] init];
//    mode2.device = model1;
//    [self.dataArray addObject:mode2];
    
    [self.tableView reloadData];
}

@end
