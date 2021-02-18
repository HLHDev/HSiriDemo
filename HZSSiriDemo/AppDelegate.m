//
//  AppDelegate.m
//  HZSSiriDemo
//
//  Created by H&L on 2019/11/27.
//  Copyright © 2019 H&L. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window setRootViewController:nvc];
    return YES;
}


#pragma mark userActivityDelegate

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    if ([userActivity.activityType isEqualToString:@"com.zhys.siritest"]) {
        NSLog(@"siri enter app");
    }
    return YES;
}


@end
