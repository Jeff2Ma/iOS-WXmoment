//
//  AppDelegate.m
//  WXmoment
//
//  Created by JeffMa on 2016/10/24.
//  Copyright © 2016年 DW. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MomentViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 系统初始化
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor grayColor];//给window设置一个背景色
//    [self.window makeKeyAndVisible];//让window显示出来
    
    // 增加标题栏 http://ju.outofmemory.cn/entry/284956
    LoginViewController *loginView = [[LoginViewController alloc]  init];
    
    MomentViewController * momentView = [[MomentViewController alloc]  init];
    
    // 设置哪个 view 作为 root view
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:loginView];
    
    loginView.view.backgroundColor = [UIColor whiteColor];
    momentView.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootNavigationController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background œstate.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
