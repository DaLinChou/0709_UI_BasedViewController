//
//  AppDelegate.m
//  0709_UI_BasedViewController
//
//  Created by rimi on 15/7/9.
//  Copyright (c) 2015年 周林. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    ViewController * root_vc = [[ViewController alloc] init];
    _window.rootViewController = root_vc;
    
    return YES;
}


@end
