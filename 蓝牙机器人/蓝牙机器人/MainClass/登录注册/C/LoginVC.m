//
//  LoginVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/21.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "LoginVC.h"
#import "JXTimeButton.h"
#import "ForgetPasswordVC.h"

@interface LoginVC ()

@property (nonatomic, weak) UIButton *miMaLoginBtn ;
@property (nonatomic, weak) UIButton *yanZhenLoginBtn ;
@property (nonatomic, weak) UIView *lineView;
@property (nonatomic, weak) UIView *miMaloginView;
@property (nonatomic, weak) UIView *yanZhenloginView;

@end

@implementation LoginVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"登录";
    
    [self drawView];
}

- (void)drawView
{
//    UIButton *miMaLoginBtn = [[UIButton alloc] init];
//    [miMaLoginBtn setTitle:@"密码登录" forState:UIControlStateNormal];
//    [miMaLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    miMaLoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    miMaLoginBtn.backgroundColor = [UIColor whiteColor];
//    [miMaLoginBtn addTarget:self action:@selector(didClickMiMaLoginBtn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:miMaLoginBtn];
//    self.miMaLoginBtn = miMaLoginBtn;
//    
//    UIButton *yanZhenLoginBtn = [[UIButton alloc] init];
//    [yanZhenLoginBtn setTitle:@"验证登录" forState:UIControlStateNormal];
//    [yanZhenLoginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    yanZhenLoginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    yanZhenLoginBtn.backgroundColor = [UIColor whiteColor];
//    [yanZhenLoginBtn addTarget:self action:@selector(didClickYanZhenLoginBtn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:yanZhenLoginBtn];
//    self.yanZhenLoginBtn = yanZhenLoginBtn;
    
//    UIView *lineView = [[UIView alloc] init];
//    lineView.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
//    [self.view addSubview:lineView];
//    self.lineView = lineView;
    
//    UIView *miMaloginView = [[UIView alloc] init];
//    miMaloginView.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
//    miMaloginView.hidden = NO;
//    [self.view addSubview:miMaloginView];
//    self.miMaloginView = miMaloginView;
    
    UIView *yanZhenloginView = [[UIView alloc] init];
    yanZhenloginView.backgroundColor = [UIColor colorWithRed:0.906 green:0.910 blue:0.914 alpha:1.00];
    yanZhenloginView.hidden = NO;
    [self.view addSubview:yanZhenloginView];
    self.yanZhenloginView = yanZhenloginView;

//-----------------------------------------------------------------------------
//    UITextField *nameTextField = [[UITextField alloc] init];
//    nameTextField.placeholder = @"用户名";
//    nameTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user"]];
//    nameTextField.leftViewMode = UITextFieldViewModeAlways;
//    nameTextField.font = [UIFont systemFontOfSize:16];
//    nameTextField.backgroundColor = [UIColor whiteColor];
//    nameTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    nameTextField.layer.borderWidth = 0.5;
//    [miMaloginView addSubview:nameTextField];
//    
//    UITextField *passwordTextField = [[UITextField alloc] init];
//    passwordTextField.placeholder = @"密码";
//    passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pw"]];
//    passwordTextField.leftViewMode = UITextFieldViewModeAlways;
//    passwordTextField.font = [UIFont systemFontOfSize:16];
//    passwordTextField.backgroundColor = [UIColor whiteColor];
//    passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    passwordTextField.layer.borderWidth = 0.5;
//    passwordTextField.secureTextEntry = YES;
//    [miMaloginView addSubview:passwordTextField];
//    
//    UIButton *loginBtn = [[UIButton alloc] init];
//    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
//    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
//    loginBtn.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
//    [loginBtn addTarget:self action:@selector(didClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
//    [miMaloginView addSubview:loginBtn];
//    
//    UIButton *forgetPasswodrBtn = [[UIButton alloc] init];
//    [forgetPasswodrBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
//    [forgetPasswodrBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    forgetPasswodrBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//    [forgetPasswodrBtn addTarget:self action:@selector(didClickForgetPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
//    [miMaloginView addSubview:forgetPasswodrBtn];
    
//-----------------------------------------------------------------------------
    UITextField *telTextField = [[UITextField alloc] init];
    telTextField.placeholder = @"手机号码";
    telTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];
    telTextField.leftViewMode = UITextFieldViewModeAlways;
    telTextField.font = [UIFont systemFontOfSize:16];
    telTextField.backgroundColor = [UIColor whiteColor];
    telTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    telTextField.layer.borderWidth = 0.5;
    [yanZhenloginView addSubview:telTextField];
    
    UITextField *yanZhenMaTextField = [[UITextField alloc] init];
    yanZhenMaTextField.placeholder = @"验证码";
    yanZhenMaTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"key"]];
    yanZhenMaTextField.leftViewMode = UITextFieldViewModeAlways;
    yanZhenMaTextField.font = [UIFont systemFontOfSize:16];
    yanZhenMaTextField.backgroundColor = [UIColor whiteColor];
    yanZhenMaTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    yanZhenMaTextField.layer.borderWidth = 0.5;
    [yanZhenloginView addSubview:yanZhenMaTextField];
    
    UIButton *loginBtn2 = [[UIButton alloc] init];
    [loginBtn2 setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn2.titleLabel.font = [UIFont systemFontOfSize:16];
    loginBtn2.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
    [loginBtn2 addTarget:self action:@selector(didClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [yanZhenloginView addSubview:loginBtn2];
    
    UIButton *forgetPasswodrBtn2 = [[UIButton alloc] init];
    [forgetPasswodrBtn2 setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPasswodrBtn2 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    forgetPasswodrBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetPasswodrBtn2 addTarget:self action:@selector(didClickForgetPasswordBtn) forControlEvents:UIControlEventTouchUpInside];
    [yanZhenloginView addSubview:forgetPasswodrBtn2];
    
//    miMaLoginBtn.sd_layout
//    .leftSpaceToView(self.view,0)
//    .topSpaceToView(self.view,0)
//    .widthIs(ScreenWidth/2)
//    .heightIs(44);
//    
//    yanZhenLoginBtn.sd_layout
//    .rightSpaceToView(self.view,0)
//    .topSpaceToView(self.view,0)
//    .widthIs(ScreenWidth/2)
//    .heightIs(44);
//    
//    lineView.sd_layout
//    .centerXEqualToView(miMaLoginBtn)
//    .topSpaceToView(miMaLoginBtn,-2)
//    .widthIs(100)
//    .heightIs(2);
//    
//    miMaloginView.sd_layout
//    .topSpaceToView(miMaLoginBtn,0)
//    .leftSpaceToView(self.view,0)
//    .rightSpaceToView(self.view,0)
//    .bottomSpaceToView(self.view,0);
    
    yanZhenloginView.sd_layout
    .topSpaceToView(self.view,0)
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0);
    
//-------------------------------------------------------------------------
//    nameTextField.sd_layout
//    .topSpaceToView(miMaloginView,15)
//    .leftSpaceToView(miMaloginView,15)
//    .rightSpaceToView(miMaloginView,15)
//    .heightIs(40);
//    
//    passwordTextField.sd_layout
//    .topSpaceToView(nameTextField,15)
//    .leftSpaceToView(miMaloginView,15)
//    .rightSpaceToView(miMaloginView,15)
//    .heightIs(40);
//    
//    loginBtn.sd_layout
//    .topSpaceToView(passwordTextField,15)
//    .leftSpaceToView(miMaloginView,15)
//    .rightSpaceToView(miMaloginView,15)
//    .heightIs(40);
//    
//    forgetPasswodrBtn.sd_layout
//    .topSpaceToView(loginBtn,5)
//    .centerXEqualToView(loginBtn)
//    .widthIs(100)
//    .heightIs(20);
    
//-------------------------------------------------------------------------
    
    telTextField.sd_layout
    .topSpaceToView(yanZhenloginView,15)
    .leftSpaceToView(yanZhenloginView,15)
    .rightSpaceToView(yanZhenloginView,15)
    .heightIs(40);
    
    yanZhenMaTextField.sd_layout
    .topSpaceToView(telTextField,15)
    .leftSpaceToView(yanZhenloginView,15)
    .rightSpaceToView(yanZhenloginView,15)
    .heightIs(40);
    
    loginBtn2.sd_layout
    .topSpaceToView(yanZhenMaTextField,15)
    .leftSpaceToView(yanZhenloginView,15)
    .rightSpaceToView(yanZhenloginView,15)
    .heightIs(40);
    
    forgetPasswodrBtn2.sd_layout
    .topSpaceToView(loginBtn2,5)
    .centerXEqualToView(loginBtn2)
    .widthIs(100)
    .heightIs(20);
    
    UIView *yuanZhenMaRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 110, 40)];
    yuanZhenMaRightView.backgroundColor = [UIColor clearColor];
    yanZhenMaTextField.rightView = yuanZhenMaRightView;
    yanZhenMaTextField.rightViewMode = UITextFieldViewModeAlways;
    
    JXTimeButton * timeBtn = [[JXTimeButton alloc] initWithFrame:CGRectMake(0, 0, 90, 20) AndBeforeTitle:@"获取验证码" AndWorkingMarkStr:@"剩余时间:" AndTimeSum:10 AndTimeButtonStar:^{
        NSLog(@"STAR");
    } AndTimeButtonStop:^{
        NSLog(@"STOP");
    }];
    timeBtn.textColor = [UIColor whiteColor];
    timeBtn.center = self.view.center;
    timeBtn.font = [UIFont systemFontOfSize:14];
    timeBtn.textAlignment = 1;
    timeBtn.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
    timeBtn.layer.masksToBounds = YES;
    timeBtn.layer.cornerRadius = 8;
    [yuanZhenMaRightView addSubview:timeBtn];
    
    timeBtn.sd_layout
    .centerYEqualToView(yuanZhenMaRightView)
    .rightSpaceToView(yuanZhenMaRightView,15)
    .widthIs(90)
    .heightIs(30);
    
}

- (void)didClickMiMaLoginBtn
{
    [self.miMaLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.yanZhenLoginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.miMaloginView.hidden = NO;
    self.yanZhenloginView.hidden = YES;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(self.miMaLoginBtn)
    .topSpaceToView(self.miMaLoginBtn,-2)
    .widthIs(100)
    .heightIs(2);
}

- (void)didClickYanZhenLoginBtn
{
    [self.miMaLoginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.yanZhenLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.miMaloginView.hidden = YES;
    self.yanZhenloginView.hidden = NO;
    
    self.lineView.sd_resetLayout
    .centerXEqualToView(self.yanZhenLoginBtn)
    .topSpaceToView(self.yanZhenLoginBtn,-2)
    .widthIs(100)
    .heightIs(2);
}

- (void)didClickForgetPasswordBtn
{
    ForgetPasswordVC *vc = [[ForgetPasswordVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didClickLoginBtn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
