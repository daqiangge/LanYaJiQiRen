//
//  PersonInfoVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/24.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "PersonInfoVC.h"
#import "ChangeIconCell.h"
#import "PerfonInfoCell.h"
#import "PerfonInfoCell2.h"
#import "RSKImageCropper.h"

@interface PersonInfoVC ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate,RSKImageCropViewControllerDelegate>

@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, weak) UITableView *tableView;

@end

@implementation PersonInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人资料";
    self.view.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    [self drawView];
}

- (void)drawView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.sd_layout
    .leftSpaceToView(self.view,0)
    .topSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
}

- (void)save
{
    [self requestUpdateName];
}

- (void)changeIconImageView
{
    __weak typeof(self) weakSelf = self;
    LCActionSheet *sheet = [[LCActionSheet alloc] initWithTitle:nil buttonTitles:@[@"拍照",@"从相册中选取"] redButtonIndex:-1 delegate:nil];
    sheet.didClickedButtonAtIndex = ^(NSInteger btnIndex,NSString *title){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = weakSelf;
        
        if (btnIndex == 0)
        {
            //判断相机是否可用
            BOOL hasCamera = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
            if (hasCamera)
            {
                UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.sourceType = sourceType;
                picker.allowsEditing = NO;
                [self presentViewController:picker animated:YES completion:nil];
            }
            else
            {
                UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"相机不可用" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alter show];
            }
        }
        else if (btnIndex == 1)
        {
            // 从相册中选取
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            picker.navigationBar.barTintColor = NAV_BAR_COLOR;
            picker.navigationBar.tintColor = [UIColor whiteColor];
            picker.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
            [weakSelf presentViewController:picker animated:YES completion:nil];
        }
    };
    [sheet show];
}

#pragma mark -
#pragma mark ================= <UITableViewDelegate,UITableViewDataSource> =================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        ChangeIconCell *cell = [ChangeIconCell cellWithTableView:tableView];
        cell.imageUrlStr = [ModelDeviceAndNurse sharedManager].nurse.photo;
        cell.iconImage = self.iconImage;
        return cell;
    }
    
    if (indexPath.row == 0) {
        PerfonInfoCell *cell = [PerfonInfoCell cellWithTableView:tableView];
        cell.textField.text = [ModelDeviceAndNurse sharedManager].nurse.name;
        return cell;
    }else{
        PerfonInfoCell2 *cell = [PerfonInfoCell2 cellWithTableView:tableView];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 65;
    }
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self changeIconImageView];
    }
}

#pragma mark -
#pragma mark ================= UIImagePickerControllerDelegate =================
/**
 *  从相册获取照片的回掉
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)aImage editingInfo:(NSDictionary *)editingInfo
{
    RSKImageCropViewController *imageCropVC = [[RSKImageCropViewController alloc] initWithImage:aImage];
    imageCropVC.delegate = self;
    [picker presentViewController:imageCropVC animated:NO completion:nil];
}

#pragma mark -
#pragma mark ================= RSKImageCropViewControllerDelegate =================
- (void)imageCropViewControllerDidCancelCrop:(RSKImageCropViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageCropViewController:(RSKImageCropViewController *)controller
                   didCropImage:(UIImage *)croppedImage
                  usingCropRect:(CGRect)cropRect
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.iconImage = croppedImage;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakSelf.tableView reloadData];
    });
}

#pragma mark -
#pragma mark ================= 网络 =================
- (void)requestUpdatePhoto
{
    if (!self.iconImage)
    {
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[UserDefaults valueForKey:@"username"] forKey:@"mobile"];
    
    NSMutableArray *files = [NSMutableArray array];
    NSDictionary *fileDic = @{
                              @"kFileData" : UIImageJPEGRepresentation(self.iconImage, 0.1),
                              @"kName" : @"file",
                              @"kFileName" : @"file.jpg",
                              @"kMimeType" : @"file"
                              };
    [files addObject:fileDic];
    
    
    [[LQHTTPSessionManager sharedManager] LQPost:URLSTR(@"/app/sys/user/updatePhoto") parameters:params fileInfo:files showTips:@"正在保存..." success:^(id responseObject) {
        
        [LCProgressHUD showSuccess:@"头像保存成功"];
        [ModelDeviceAndNurse sharedManager].nurse.photo = [responseObject valueForKey:@"photo"];
        NSLog(@"--->%@",[ModelDeviceAndNurse sharedManager].nurse.photo);
        [self.tableView reloadData];
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)requestUpdateName
{
    PerfonInfoCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    if (!cell.textField.text.length)
    {
        [LCProgressHUD showFailure:@"请填写用户名"];
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:[UserDefaults valueForKey:@"username"] forKey:@"mobile"];
    [params setValue:cell.textField.text forKey:@"name"];
    
    [[LQHTTPSessionManager sharedManager] LQPost:URLSTR(@"/app/sys/user/updateName") parameters:params showTips:@"正在保存..." success:^(id responseObject) {
        
        [ModelDeviceAndNurse sharedManager].nurse.name = cell.textField.text;
        
        [LCProgressHUD showSuccess:@"用户名保存成功"];
        
        [self requestUpdatePhoto];
        
    } successBackfailError:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}


@end
