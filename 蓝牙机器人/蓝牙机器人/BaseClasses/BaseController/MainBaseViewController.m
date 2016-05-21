//
//  MainBaseViewController.m
//  lingdaozhe
//
//  Created by liqiang on 16/5/5.
//  Copyright © 2016年 bckj. All rights reserved.
//

#import "MainBaseViewController.h"
#import "LCProgressHUD.h"


#define color_bg  [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0]

@interface MainBaseViewController ()

@end

@implementation MainBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationController.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBarController.automaticallyAdjustsScrollViewInsets = NO;
    
    self.supportPortraitOnly = YES;
    self.view.backgroundColor = color_bg;
   
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationController.navigationBarHidden=NO;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.navigationController.navigationBar.barTintColor = NAV_BAR_COLOR;
    self.navigationController.navigationBar.tintColor = COLOR_White;
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:COLOR_White,NSForegroundColorAttributeName,[UIFont fontWithName:@"HelveticaNeue-Bold" size:18],NSFontAttributeName,nil]];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

@end
