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

#import <AudioToolbox/AudioToolbox.h>
#import "QuartzCore/QuartzCore.h"
#import "NSData+LQCategory.h"

@interface LanInfoVC ()<UITableViewDelegate,UITableViewDataSource>

//@property (nonatomic, weak) UITextField *textField;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableData *receiveData;
@property (nonatomic, strong) NSMutableData *backupsReceiveData;

@property (nonatomic, copy) NSString *surplusNum;
@property (nonatomic, copy) NSString *alreadyUsedNum;

@end

@implementation LanInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"授权使用";
    
    self.sensor.delegate = self;
    
    self.surplusNum = @"";
    self.alreadyUsedNum = @"";
    
    self.receiveData = [NSMutableData data];
    
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
    self.tableView = tableView;
    
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
//    [self requestUpdatePasswordByMobile];
    
    LanInfoCell2 *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    UITextField *textField = cell.textField;
    
    NSString *numStr = [textField.text stringByReplacingOccurrencesOfString:@"－" withString:@"-"];
    
    NSLog(@"--->%d",[numStr intValue]);
    NSLog(@"--->%d",[self.model.hospital.currentCount intValue]);
    
    if ([numStr intValue] > [self.model.hospital.currentCount intValue])
    {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"您填写的授权次数已经大于最大授权次数，请重新填写！" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
        return;
    }
    
    if (![numStr LQ_isPureInt])
    {
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"请填写正确的授权次数！" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alter show];
        return;
    }
    
    NSData *headData = [self hexToBytes:@"AA11"];
    NSData *cmdData = [self hexToBytes:@"02"];
    NSData *numData = [NSData get4ByteWithId:[numStr intValue]];
    NSData *nameData1 = [self setNameData1:self.model.device.number];
    NSData *nameData2 = [self setNameData2:self.model.device.btNumber];
    NSData *stateData = [self hexToBytes:@"00"];
    NSData *CRCData =  [self setCRC8WithCmdData:cmdData numData:numData nameData1:nameData1 nameData2:nameData2 stateData:stateData];
    NSData *tailData = [self hexToBytes:@"11AA"];
    
    NSLog(@"--->%@",headData);
    NSLog(@"--->%@",cmdData);
    NSLog(@"--->%@",numData);
    NSLog(@"--->%@",nameData1);
    NSLog(@"--->%@",nameData2);
    NSLog(@"--->%@",stateData);
    NSLog(@"--->%@",CRCData);
    NSLog(@"--->%@",tailData);
    
    NSMutableData  *sendData = [NSMutableData data];
    [sendData appendData:headData];
    [sendData appendData:cmdData];
    [sendData appendData:numData];
    [sendData appendData:nameData1];
    [sendData appendData:nameData2];
    [sendData appendData:stateData];
    [sendData appendData:CRCData];
    [sendData appendData:tailData];
    
    [self.sensor write:self.sensor.activePeripheral data:sendData];
}

- (NSData *)setNameData1:(NSString *)name
{
    NSLog(@"----->%@",name);
    
    NSString *nameStr = name;
    NSMutableData *nameData1 = [NSMutableData dataWithData:[nameStr dataUsingEncoding:NSASCIIStringEncoding]];
    if (nameData1.length < 16)
    {
        unsigned long nameDataLength = nameData1.length;
        for (int i = 0; i <(16-nameDataLength); i ++)
        {
            NSData *data =  [self hexToBytes:@"00"];
            [nameData1 appendData:data];
        }
    }
    
    return nameData1;
}

- (NSData *)setNameData2:(NSString *)name
{
    NSLog(@"----->%@",name);
    
    NSMutableData *nameData1 = [NSMutableData dataWithData:[name dataUsingEncoding:NSASCIIStringEncoding]];
    if (nameData1.length < 16)
    {
        unsigned long nameDataLength = nameData1.length;
        for (int i = 0; i <(16-nameDataLength); i ++)
        {
            NSData *data =  [self hexToBytes:@"00"];
            [nameData1 appendData:data];
        }
    }
    
    return nameData1;
}

- (NSData *)setCRC8WithCmdData:(NSData *)cmdData numData:(NSData *)numData nameData1:(NSData *)nameData1  nameData2:(NSData *)nameData2 stateData:(NSData *)stateData
{
    NSMutableData *data = [NSMutableData data];
    [data appendData:cmdData];
    [data appendData:numData];
    [data appendData:nameData1];
    [data appendData:nameData2];
    [data appendData:stateData];
    
    unsigned short checksum = [data crc8];
    
    NSData *CRCData = [NSData get1ByteWithId:checksum];
    
    return CRCData;
}

- (NSData *)hexToBytes:(NSString *)str
{
    NSMutableData* data = [NSMutableData data];
    int idx;
    for (idx = 0; idx+2 <= str.length; idx+=2) {
        NSRange range = NSMakeRange(idx, 2);
        NSString* hexStr = [str substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        [data appendBytes:&intValue length:1];
    }
    return data;
}

- (void)back
{
    [LCProgressHUD showLoading:@"正在断开蓝牙连接..."];
    [self.sensor.manager cancelPeripheralConnection:self.peripheral];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD hide];
        [super back];
    });
    
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
            cell.label2.text = self.model.device.name;
            return cell;
        }
            break;
        case 1:
        {
            LanInfoCell1 *cell = [LanInfoCell1 cellWithTableView:tableView];
            cell.label1.text = @"可用次数：";
            cell.label2.text = self.model.device.currentCount;
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
            cell.label2.text = self.model.hospital.currentCount;
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

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestUpdateDeviceInfoWithDeviceCurrentCount:(NSString *)deviceCurrentCount deviceUsedCount:(NSString *)deviceUsedCount
{
    LanInfoCell2 *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    UITextField *textField = cell.textField;
    
    if (textField.text.length)
    {
        if (![textField.text LQ_isAllNum] )
        {
            [LCProgressHUD showFailure:@"请填写正确的授权次数!"];
            return;
        }
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:self.model.device.number forKey:@"number"];
    [params setValue:deviceCurrentCount forKey:@"deviceCurrentCount"];
    [params setValue:deviceUsedCount forKey:@"deviceUsedCount"];
    [params setValue:[UserDefaults valueForKey:@"username"] forKey:@"mobile"];
    
    if (!textField.text.length) {
        [params setValue:@"0" forKey:@"count"];
    }else{
        [params setValue:textField.text forKey:@"count"];
    }
    
    [[LQHTTPSessionManager sharedManager] LQPost:URLSTR(@"/app/sys/user/updateCount") parameters:params showTips:@"正在更新数据..." success:^(id responseObject) {
        
//        UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"更新成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        [alter show];
        
        
        ModelDeviceAndNurse *model = [ModelDeviceAndNurse sharedManager];
        model = [ModelDeviceAndNurse mj_objectWithKeyValues:responseObject];
        
        for (ModelDeviceListChild *childModel in model.deviceList)
        {
            if ([childModel.device.number isEqualToString:self.model.device.number])
            {
                NSLog(@"--->%@",childModel.device.currentCount);
                self.model = childModel;
                [self.tableView reloadData];
            }
        }
        
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    
    self.alreadyUsedNum = @"";
    self.surplusNum = @"";
}

#pragma mark -
#pragma mark ================= 蓝牙 =================
//recv data
-(void) serialGATTCharValueUpdated:(NSString *)UUID value:(NSData *)data
{
    NSLog(@"收到---->%@",data);
    
    if (data.length == 1)
    {
        return;
    }
    
    if (self.receiveData.length < 43)
    {
        [self.receiveData appendData:data];
    }else{
        self.receiveData = [NSMutableData data];
        [self.receiveData appendData:data];
    }
    
    if (self.receiveData.length == 43)
    {
        NSData *headData = [self.receiveData subdataWithRange:NSMakeRange(0, 2)];
        NSData *cmdData = [self.receiveData subdataWithRange:NSMakeRange(2, 1)];
        NSData *numData = [self.receiveData subdataWithRange:NSMakeRange(3, 4)];
        NSData *nameData1 = [self.receiveData subdataWithRange:NSMakeRange(7, 16)];
        NSData *nameData2 = [self.receiveData subdataWithRange:NSMakeRange(23, 16)];
        NSData *stateData = [self.receiveData subdataWithRange:NSMakeRange(39, 1)];
        NSData *CRCData = [self.receiveData subdataWithRange:NSMakeRange(40, 1)];
        NSData *tailData = [self.receiveData subdataWithRange:NSMakeRange(41, 2)];
        
        NSLog(@"headData--->%@",headData);
        NSLog(@"cmdData--->%@",cmdData);
        NSLog(@"numData--->%@",numData);
        NSLog(@"nameData1--->%@",nameData1);
        NSLog(@"nameData2--->%@",nameData2);
        NSLog(@"stateData--->%@",stateData);
        NSLog(@"CRCData--->%@",CRCData);
        NSLog(@"tailData--->%@",tailData);
        
        [self judgeCMDWithCMDData:cmdData];
        [self getNumWitnNumData:numData];
        [self getName1WithNameData1:nameData1];
        [self getName2WithNameData2:nameData2];
        [self getStateWithStateData:stateData];
        
        
        NSData *myCRCData = [self setCRC8WithCmdData:cmdData numData:numData nameData1:nameData1 nameData2:nameData2 stateData:stateData];
        
        if ([self judegeCRCWithCRCData:CRCData myCRCData:myCRCData])
        {
            if ([self judgeCMDWithCMDData:cmdData] == CMD1)
            {
                self.surplusNum = [NSString stringWithFormat:@"%d",[self getNumWitnNumData:numData]];
            }
            
            if ([self judgeCMDWithCMDData:cmdData] == CMD3)
            {
                self.alreadyUsedNum = [NSString stringWithFormat:@"%d",[self getNumWitnNumData:numData]];
            }
        }
    }
    
    if (self.surplusNum.length && self.alreadyUsedNum.length)
    {
        [self requestUpdateDeviceInfoWithDeviceCurrentCount:self.surplusNum deviceUsedCount:self.alreadyUsedNum];
    }
}

- (void)aaaaaaaaa
{
    self.receiveData = [NSMutableData dataWithData:[self hexToBytes:@"AA1102CF2BFFFF7368656265696D696E677A69313233006C616E79616D696E677A693132330000FF6911AA"]];
    
    if (self.receiveData.length == 43)
    {
        NSData *headData = [self.receiveData subdataWithRange:NSMakeRange(0, 2)];
        NSData *cmdData = [self.receiveData subdataWithRange:NSMakeRange(2, 1)];
        NSData *numData = [self.receiveData subdataWithRange:NSMakeRange(3, 4)];
        NSData *nameData1 = [self.receiveData subdataWithRange:NSMakeRange(7, 16)];
        NSData *nameData2 = [self.receiveData subdataWithRange:NSMakeRange(23, 16)];
        NSData *stateData = [self.receiveData subdataWithRange:NSMakeRange(39, 1)];
        NSData *CRCData = [self.receiveData subdataWithRange:NSMakeRange(40, 1)];
        NSData *tailData = [self.receiveData subdataWithRange:NSMakeRange(41, 2)];
        
        NSLog(@"headData--->%@",headData);
        NSLog(@"cmdData--->%@",cmdData);
        NSLog(@"numData--->%@",numData);
        NSLog(@"nameData1--->%@",nameData1);
        NSLog(@"nameData2--->%@",nameData2);
        NSLog(@"stateData--->%@",stateData);
        NSLog(@"CRCData--->%@",CRCData);
        NSLog(@"tailData--->%@",tailData);
        
        [self judgeCMDWithCMDData:cmdData];
        [self getNumWitnNumData:numData];
        [self getName1WithNameData1:nameData1];
        [self getName2WithNameData2:nameData2];
        [self getStateWithStateData:stateData];
        
        
        NSData *myCRCData = [self setCRC8WithCmdData:cmdData numData:numData nameData1:nameData1 nameData2:nameData2 stateData:stateData];
        [self judegeCRCWithCRCData:CRCData myCRCData:myCRCData];
        
    }
}

- (CMD)judgeCMDWithCMDData:(NSData *)cmdData
{
    Byte cmd1 = 0X01;//查询或回复剩余扎针次数
    Byte cmd2 = 0X02;//授权扎针次数
    Byte cmd3 = 0X03;//已使用扎针次数
    
    NSData *cmdData1 = [NSData dataWithBytes:&cmd1 length:sizeof(cmd1)];
    NSData *cmdData2 = [NSData dataWithBytes:&cmd2 length:sizeof(cmd2)];
    NSData *cmdData3 = [NSData dataWithBytes:&cmd3 length:sizeof(cmd3)];
    
    if ([cmdData isEqual:cmdData1])
    {
        NSLog(@"查询或回复剩余扎针次数");
        return CMD1;
    }else if ([cmdData isEqual:cmdData2]){
        NSLog(@"授权扎针次数");
        return CMD2;
    }else if ([cmdData isEqual:cmdData3]){
        NSLog(@"已使用扎针次数");
        return CMD3;
    }
    
    return CMD2;
}

- (BOOL)judegeCRCWithCRCData:(NSData *)data myCRCData:(NSData *)myCRCData
{
    NSLog(@"获取到的CRC--->%@ \n 我计算的CRC--->%@",data,myCRCData);
    
    if ([data isEqual:myCRCData])
    {
        NSLog(@"CRC校验正确");
        return YES;
    }
    
    return NO;
}

- (int)getNumWitnNumData:(NSData *)data
{
    //将data倒序
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 0; i < 4; i ++)
    {
        NSData *dataa = [data subdataWithRange:NSMakeRange(i, 1)];
        [dataArray addObject:dataa];
    }
    NSMutableData *numData = [NSMutableData data];
    for (int i = 3; i>=0; i--)
    {
        NSData *data = dataArray[i];
        [numData appendData:data];
    }
    
    //4字节表示的int
    int value = CFSwapInt32BigToHost(*(int*)([numData bytes]));//655650
    return value;
    NSLog(@"次数为---->%d",value);
}

- (void)getName1WithNameData1:(NSData *)data
{
    NSString *nameStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"名称1-->%@",nameStr);
}

- (void)getName2WithNameData2:(NSData *)data
{
    NSString *nameStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"名称2-->%@",nameStr);
}

- (void)getStateWithStateData:(NSData *)data
{
    NSLog(@"状态-->%@",data);
}

-(void)setConnect
{
//    CFStringRef s = CFUUIDCreateString(kCFAllocatorDefault, (__bridge CFUUIDRef )sensor.activePeripheral.identifier);
//    HMSoftUUID.text = (__bridge NSString*)s;
//    tvRecv.text = @"OK+CONN";
}

-(void)setDisconnect
{
//    tvRecv.text= [tvRecv.text stringByAppendingString:@"OK+LOST"];
}

#pragma mark -
#pragma mark =================  =================
- (NSString *)ToHex:(uint32_t)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    uint32_t ttmpig;
    for (int i = 0; i<9; i++) {
        ttmpig=tmpid%16;
        tmpid=tmpid/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            default:
                nLetterValue = [NSString stringWithFormat:@"%u",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0)
        {
            break;
        }
        
    }
    return str;
}

- (NSString *)toDecimalSystemWithBinarySystem:(NSString *)binary
{
    int ll = 0 ;
    int  temp = 0 ;
    
    for (int i = 0; i < binary.length; i ++)
    {
        temp = [[binary substringWithRange:NSMakeRange(i, 1)] intValue];
        temp = temp * powf(2, binary.length - i - 1);
        ll += temp;
    }
    
    NSString * result = [NSString stringWithFormat:@"%d",ll];
    
    return result;
}

//将16进制转化为二进制
-(NSString *)getBinaryByhex:(NSString *)hex
{
    NSMutableDictionary  *hexDic = [[NSMutableDictionary alloc] init];
    
    hexDic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    [hexDic setObject:@"0000" forKey:@"0"];
    
    [hexDic setObject:@"0001" forKey:@"1"];
    
    [hexDic setObject:@"0010" forKey:@"2"];
    
    [hexDic setObject:@"0011" forKey:@"3"];
    
    [hexDic setObject:@"0100" forKey:@"4"];
    
    [hexDic setObject:@"0101" forKey:@"5"];
    
    [hexDic setObject:@"0110" forKey:@"6"];
    
    [hexDic setObject:@"0111" forKey:@"7"];
    
    [hexDic setObject:@"1000" forKey:@"8"];
    
    [hexDic setObject:@"1001" forKey:@"9"];
    
    [hexDic setObject:@"1010" forKey:@"A"];
    
    [hexDic setObject:@"1011" forKey:@"B"];
    
    [hexDic setObject:@"1100" forKey:@"C"];
    
    [hexDic setObject:@"1101" forKey:@"D"];
    
    [hexDic setObject:@"1110" forKey:@"E"];
    
    [hexDic setObject:@"1111" forKey:@"F"];
    
    [hexDic setObject:@"1010" forKey:@"a"];
    
    [hexDic setObject:@"1011" forKey:@"b"];
    
    [hexDic setObject:@"1100" forKey:@"c"];
    
    [hexDic setObject:@"1101" forKey:@"d"];
    
    [hexDic setObject:@"1110" forKey:@"e"];
    
    [hexDic setObject:@"1111" forKey:@"f"];
    
    NSMutableString *binaryString=[[NSMutableString alloc] init];
    
    for (int i=0; i<[hex length]; i++) {
        
        NSRange rage;
        
        rage.length = 1;
        
        rage.location = i;
        
        NSString *key = [hex substringWithRange:rage];
        
        //NSLog(@"%@",[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]);
        
        binaryString = [NSMutableString stringWithFormat:@"%@%@",binaryString,[NSString stringWithFormat:@"%@",[hexDic objectForKey:key]]];
        
    }
    
    NSLog(@"转化后的二进制为:%@",binaryString);
    
    return binaryString;
    
}

@end
