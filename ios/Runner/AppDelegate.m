#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "MyNavigationController.h"
#import "MyTabBarController.h"
#import "PlatformRouterImp.h"
#import <flutter_boost/FlutterBoost.h>
#import "LoginViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) PlatformRouterImp *router;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];

    self.router = [PlatformRouterImp new];
    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:_router
                                                        onStart:^(FlutterEngine *engine) {
    }];

    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
//    UITabBarController *tabVC = [[MyTabBarController alloc] init];
//    UINavigationController *rvc = [[MyNavigationController alloc] initWithRootViewController:tabVC];
//    router.navigationController = rvc;
//    self.window.rootViewController = rvc;
    [self isLogin:NO];
    [self.window makeKeyAndVisible];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)isLogin:(BOOL)login {
    if (login) {
        UITabBarController *tabVC = [[MyTabBarController alloc] init];
        UINavigationController *rvc = [[MyNavigationController alloc] initWithRootViewController:tabVC];
        _router.navigationController = rvc;
        self.window.rootViewController = rvc;
    } else {
        UIViewController *loginVC = [[LoginViewController alloc] init];
        UINavigationController *rvc = [[MyNavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = rvc;
    }
}

@end
