//
//  Navigator.m
//  Runner
//
//  Created by 飞鱼 on 2020/1/3.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "Navigator.h"
#import <flutter_boost/FlutterBoost.h>

@implementation Navigator

+ (void)pushURL:(NSString *)URLString params:(NSDictionary *)params {
    [FlutterBoostPlugin open:URLString urlParams:params exts:@{@"animated":@YES} onPageFinished:^(NSDictionary * _Nonnull dic) {
    } completion:^(BOOL val) {
    }];
}

+ (void)presentURL:(NSString *)URLString params:(NSDictionary *)params {
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:params];
    [mutDic setObject:@YES forKey:@"present"];
    [FlutterBoostPlugin open:URLString urlParams:params exts:@{@"animated":@YES} onPageFinished:^(NSDictionary * _Nonnull dic) {
    } completion:^(BOOL val) {
    }];
}

@end
