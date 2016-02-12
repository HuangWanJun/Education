//
//  AppDelegate.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "SecondeViewController.h"
#import "ThirdViewController.h"
#import "ProfileViewController.h"
#import "UINavigationController+YRBackGesture.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    return YES;
}

-(void)bulidSB{

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    tabBar = [[UITabBarController alloc]init];
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:[[HomeViewController alloc]init]];
    // nav.enableBackGesture=YES;
    nav.tabBarItem.title=@"首页";
    nav.tabBarItem.image=[UIImage imageNamed:@"hometab"];
    SecondeViewController *secVC= [[SecondeViewController alloc]init];
    secVC.tabBarItem.title=@"课程";
    secVC.tabBarItem.image=[UIImage imageNamed:@"messageTab"];
    ThirdViewController *thirdVC= [[ThirdViewController alloc]init];
    thirdVC.tabBarItem.title=@"discoverTab";
    thirdVC.tabBarItem.image=[UIImage imageNamed:@"haveMsg"];
    ProfileViewController *profileVC= [[ProfileViewController alloc]init];
    profileVC.tabBarItem.title=@"我的";
    profileVC.tabBarItem.image=[UIImage imageNamed:@"meTab"];
    tabBar.viewControllers = @[nav,secVC,thirdVC,profileVC];
    self.window.rootViewController = tabBar;
}


@end
