//
//  RouterProtocal.h
//  Runner
//
//  Created by 飞鱼 on 2020/1/3.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RouterProtocol <NSObject>
@required
- (void)routerWithNav:(UINavigationController *)nav params:(NSDictionary *)params;

@end
