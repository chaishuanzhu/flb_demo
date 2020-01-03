//
//  PlantformRouterImp.m
//  Runner
//
//  Created by 飞鱼 on 2020/1/2.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "PlatformRouterImp.h"
#import "NativeViewController.h"
#import "RouterProtocol.h"

@interface PlatformRouterImp ()

@property (nonatomic, strong) NSDictionary<NSString *, Class> *router;

@end

@implementation PlatformRouterImp

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initNativeRouter];
    }
    return self;
}

- (void)initNativeRouter {
    self.router = @{@"flbdemo://native/page": [NativeViewController class]};
}

#pragma mark - Boost 1.5
- (void)open:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    NSURL *url = [NSURL URLWithString:name];
    if ([url.host isEqualToString:@"native"]) {
        [self handleNativeRouter:name urlParams:params exts:exts completion:completion];
    } else if ([url.host isEqualToString:@"flutter"]){
        [self handleFlutterRouter:name urlParams:params exts:exts completion:completion];
    } else if ([url.host isEqualToString:@"web"]) {

    }
}

- (void)present:(NSString *)name
   urlParams:(NSDictionary *)params
        exts:(NSDictionary *)exts
  completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController presentViewController:vc animated:animated completion:^{
        if(completion) completion(YES);
    }];
}

- (void)close:(NSString *)uid
       result:(NSDictionary *)result
         exts:(NSDictionary *)exts
   completion:(void (^)(BOOL))completion
{
    BOOL animated = [exts[@"animated"] boolValue];
    animated = YES;
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}

- (void)handleNativeRouter:(NSString *)name
                 urlParams:(NSDictionary *)params
                      exts:(NSDictionary *)exts
                completion:(void (^)(BOOL))completion {
    Class class = _router[name];
    id<RouterProtocol> nativeClass = [[class alloc]init];
    BOOL isConform = [nativeClass conformsToProtocol:@protocol(RouterProtocol)];
    if (!isConform) return;
    [nativeClass routerWithNav:_navigationController params:params];
}

- (void)handleFlutterRouter:(NSString *)name
                  urlParams:(NSDictionary *)params
                       exts:(NSDictionary *)exts
                 completion:(void (^)(BOOL))completion {
    BOOL animated = [exts[@"animated"] boolValue];
    FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
    [vc setName:name params:params];
    [self.navigationController pushViewController:vc animated:animated];
    if(completion) completion(YES);
}

@end
