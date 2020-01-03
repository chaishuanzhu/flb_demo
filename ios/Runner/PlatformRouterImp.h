//
//  PlantformRouterImp.h
//  Runner
//
//  Created by 飞鱼 on 2020/1/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <flutter_boost/FlutterBoost.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlatformRouterImp : NSObject<FLBPlatform>

@property (nonatomic,strong) UINavigationController *navigationController;

@end

NS_ASSUME_NONNULL_END
