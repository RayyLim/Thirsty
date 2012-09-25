//
//  AppDelegate.m
//  Tippsy
//
//  Created by Raymond Lim on 9/19/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "SharedModel.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"Entering %s",__FUNCTION__);

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Entering %s",__FUNCTION__);

    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    SharedModel *sharedModel = [SharedModel sharedModel];
    if(sharedModel.listeningForShake == YES)
    {
        [[SharedModel sharedModel] stopListeningForShake];
    }
        
    [[SharedModel sharedModel] disconnectSphero];

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Entering %s",__FUNCTION__);

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    //user press home then resumes game    
    NSLog(@"Entering %s",__FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"Entering %s",__FUNCTION__);
    
    [[SharedModel sharedModel] setupRobotConnection];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"Entering %s",__FUNCTION__);

    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
