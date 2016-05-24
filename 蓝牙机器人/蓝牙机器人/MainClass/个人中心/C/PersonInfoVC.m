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
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"保存成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alter show];
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
        cell.iconImage = self.iconImage;
        return cell;
    }
    
    if (indexPath.row == 0) {
        PerfonInfoCell *cell = [PerfonInfoCell cellWithTableView:tableView];
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
    [self.tableView reloadData];
}


@end
