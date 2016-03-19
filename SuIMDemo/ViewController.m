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
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
