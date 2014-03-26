//
//  AppDelegate.m
//  ExCITeMap v4
//
//  Created by ExCITe Desk on 3/5/14.
//  Copyright (c) 2014 ExCITe Desk. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Set styling of status bar.
    return UIStatusBarStyleLightContent;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize window.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Set background style.
    self.window.backgroundColor = UIColorFromRGB(0xfdfdfd); // #fdfdfd is off-white
    [self.window makeKeyAndVisible];
    
    // Set nav bar styles.
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x3498db)]; // #3498db is blue (peter river if using flatuicolors.com)
    
    // Set tab bar styles.
    [[UITabBar appearance] setBarTintColor:UIColorFromRGB(0xfdfdfd)]; // #fdfdfd is off-white
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold"
                                                                                              size:10.0f], NSForegroundColorAttributeName : UIColorFromRGB(0x3498db)} forState:UIControlStateSelected]; // #0x3498db is blue (peter river if using flatuicolors.com)
    
    // Add map view.
    MapViewController *mapVC = [[MapViewController alloc] init];
    UINavigationController *mapNavController = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    // Add lights view.
    LightsViewController *lightsVC = [[LightsViewController alloc] init];
    UINavigationController *lightsNavController = [[UINavigationController alloc] initWithRootViewController:lightsVC];
    
    // Add tab bar controller.
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[mapNavController, lightsNavController];
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end