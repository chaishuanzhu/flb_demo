//
//  Tab2ViewController.m
//  Runner
//
//  Created by 飞鱼 on 2020/1/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "Tab2ViewController.h"
#import "AppDelegate.h"

@interface Tab2ViewController ()

@end

@implementation Tab2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
    [button setTitle:@"logout" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.center = self.view.center;
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)logoutAction {
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate isLogin:NO];
}

@end
