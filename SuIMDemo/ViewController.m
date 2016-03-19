//
//  ViewController.m
//  SuIMDemo
//
//  Created by AbelSu on 16/3/19.
//  Copyright © 2016年 AbelSu. All rights reserved.
//

#import "ViewController.h"
#import "NIMSDK.h"

@interface ViewController ()<NIMChatManagerDelegate>

@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UILabel *actTitleLabel;
@property (nonatomic,strong) UILabel *pwdTitleLabel;
@property (nonatomic,strong) UITextField *accountTextField;
@property (nonatomic,strong) UITextField *pwdTextField;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *accountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    self.loginBtn.frame = CGRectMake(120, 300, 160, 30);
    [self.loginBtn.layer setCornerRadius:10];
    [self.loginBtn.layer setBorderWidth:.5f];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    self.actTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 60, 30)];
    self.actTitleLabel.text = @"账  号";
    [self.view addSubview:self.actTitleLabel];
    
    self.accountTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 150, 200, 30)];
    self.accountTextField.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
    [self.view addSubview:self.accountTextField];
    
    self.accountLabel = [[UILabel alloc]initWithFrame:CGRectMake(142, 80, 200, 30)];
    [self.view addSubview:self.accountLabel];
    
    self.pwdTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 210, 60, 30)];
    self.pwdTitleLabel.text = @"密  码";
    [self.view addSubview:self.pwdTitleLabel];
    
    
    self.pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(100, 210, 200, 30)];
    self.pwdTextField.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.1];
    [self.view addSubview:self.pwdTextField];
    
    
}

- (void)login:(id)sender{
    [[[NIMSDK sharedSDK] loginManager] login:self.accountTextField.text
                                       token:self.pwdTextField.text
                                  completion:^(NSError *error) {
                                      [self uiAfterLogin:error];
                                  }];
}

- (void)logout:(id)sender{
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error){
        [self uiAfterLogout:error];
    }];
}

// 对登录结果进行UI变化
- (void)uiAfterLogin:(NSError *)error{
    if (!error) {
        self.pwdTitleLabel.hidden = YES;
        self.actTitleLabel.hidden = YES;
        self.accountTextField.hidden = YES;
        self.pwdTextField.hidden = YES;
        self.accountLabel.text = [@"账号名 :" stringByAppendingString:self.accountTextField.text];
        [self.loginBtn setTitle:@"登  出" forState:UIControlStateNormal];
        [self.loginBtn removeTarget:self action:NULL forControlEvents:UIControlEventTouchUpInside];
        [self.loginBtn addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"登录成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"登录失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

//对登出结果进行UI变化
- (void)uiAfterLogout:(NSError *)error{
    self.pwdTitleLabel.hidden = NO;
    self.actTitleLabel.hidden = NO;
    self.accountTextField.hidden = NO;
    self.pwdTextField.hidden = NO;
    self.accountLabel.hidden =YES;
    [self.loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"登出成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
