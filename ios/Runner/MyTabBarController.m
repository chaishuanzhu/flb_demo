//
//  MyTabBarController.m
//  Runner
//
//  Created by 飞鱼 on 2020/1/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <flutter_boost/FlutterBoost.h>
#import "MyTabBarController.h"

#import "FLBViewController.h"
#import "Tab2ViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FLBFlutterViewContainer *fvc = FLBViewController.new;
    [fvc setName:@"tab1" params:@{}];
    fvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab1" image:nil tag:1];

    Tab2ViewController *vc = [[Tab2ViewController alloc] init];
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab2" image:nil tag:2];

    FLBFlutterViewContainer *fvc3 = FLBViewController.new;
    [fvc3 setName:@"tab3" params:@{}];
    fvc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab3" image:nil tag:3];

    FLBFlutterViewContainer *fvc4 = FLBViewController.new;
    [fvc4 setName:@"tab4" params:@{}];
    fvc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"tab4" image:nil tag:4];

    self.viewControllers = @[fvc,vc,fvc3,fvc4];
}



@end
