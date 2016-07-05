//
//  FanKuiVC.m
//  蓝牙机器人
//
//  Created by liqiang on 16/5/22.
//  Copyright © 2016年 LiQiang. All rights reserved.
//

#import "FanKuiVC.h"

@interface FanKuiVC ()

@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UITextField *yanZhenMaTextField;
@end

@implementation FanKuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"意见反馈";
    
    [self drawView];
}

- (void)drawView
{
    UITextView *textView = [[UITextView alloc] init];
    textView.placeholder = @"有什么想说的，尽管来吐槽吧！";
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.layer.borderWidth = 0.5;
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
    self.textView = textView;
    
    UIButton *ensureBtn = [[UIButton alloc] init];
    [ensureBtn setTitle:@"提交反馈" forState:UIControlStateNormal];
    [ensureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ensureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    ensureBtn.backgroundColor = [UIColor colorWithRed:0.325 green:0.824 blue:0.969 alpha:1.00];
    [ensureBtn addTarget:self action:@selector(commit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ensureBtn];
    
    UITextField *yanZhenMaTextField = [[UITextField alloc] init];
    yanZhenMaTextField.placeholder = @"手机号码";
    yanZhenMaTextField.font = [UIFont systemFontOfSize:15];
    yanZhenMaTextField.backgroundColor = [UIColor whiteColor];
    yanZhenMaTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    yanZhenMaTextField.layer.borderWidth = 0.5;
    yanZhenMaTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    yanZhenMaTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    yanZhenMaTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:yanZhenMaTextField];
    self.yanZhenMaTextField = yanZhenMaTextField;
    
    textView.sd_layout
    .topSpaceToView(self.view,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(150);
    
    yanZhenMaTextField.sd_layout
    .topSpaceToView(textView,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
    
    ensureBtn.sd_layout
    .topSpaceToView(yanZhenMaTextField,15)
    .leftSpaceToView(self.view,15)
    .rightSpaceToView(self.view,15)
    .heightIs(40);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)commit
{
    if (!self.textView.text.length)
    {
        [LCProgressHUD showFailure:@"请填写反馈意见"];
        return;
    }
    
    if (!self.yanZhenMaTextField.text.length) {
        [LCProgressHUD showFailure:@"请填写手机号"];
        return;
    }
    
    [LCProgressHUD showSuccess:@"提交成功"];
    
}

@end
