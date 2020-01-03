//
//  NativeViewController.m
//  Runner
//
//  Created by 飞鱼 on 2020/1/3.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "NativeViewController.h"

@interface NativeViewController ()

@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) NSDictionary *params;

@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.textView = [[UITextView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_textView];

    NSData *data = [NSJSONSerialization dataWithJSONObject:_params options:NSJSONWritingPrettyPrinted error:nil];
    NSString *stringVal = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.textView.text = stringVal;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)routerWithNav:(UINavigationController *)nav params:(NSDictionary *)params {
    _params = params;
    [nav pushViewController:self animated:YES];
}

@end
