//
//  ViewController.m
//  Tippsy
//
//  Created by Raymond Lim on 9/19/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "ViewController.h"

#import "RobotKit/RobotKit.h"

#import "RobotUIKit/RobotUIKit.h"

#import "SharedModel.h"

@implementation ViewController{
    NSTimer* timer;
}

@synthesize shakeViewController;

-(void)viewDidLoad {
    [super viewDidLoad];
    
//    /*Register for application lifecycle notifications so we known when to connect and disconnect from the robot*/
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
//
//    /*Only start the blinking loop when the view loads*/
//    robotOnline = NO;
    [[SharedModel sharedModel] registerForAppLifecycleNotifications];

    calibrateHandler = [[RUICalibrateGestureHandler alloc] initWithView:self.view];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakeDetected:) name:@"shake" object:nil];
    
//        timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(navigate) userInfo:nil repeats:NO];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//-(void)appWillResignActive:(NSNotification*)notification {
//    /*When the application is entering the background we need to close the connection to the robot*/
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:RKDeviceConnectionOnlineNotification object:nil];
//    [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:0.0];
//    [[RKRobotProvider sharedRobotProvider] closeRobotConnection];
//}
//
//-(void)appDidBecomeActive:(NSNotification*)notification {
//    /*When the application becomes active after entering the background we try to connect to the robot*/
//    [self setupRobotConnection];
//}
//
//- (void)handleRobotOnline {
//    /*The robot is now online, we can begin sending commands*/
//    if(!robotOnline) {
//        /*Only start the blinking loop once*/
//        [self toggleLED];
//    }
//    robotOnline = YES;
//}
//
//- (void)toggleLED {
//    /*Toggle the LED on and off*/
//    if (ledON) {
//        ledON = NO;
//        [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:0.0];
//    } else {
//        ledON = YES;
//        [RKRGBLEDOutputCommand sendCommandWithRed:0.0 green:0.0 blue:1.0];
//    }
//    [self performSelector:@selector(toggleLED) withObject:nil afterDelay:0.5];
//}
//
//-(void)setupRobotConnection {
//    /*Try to connect to the robot*/
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRobotOnline) name:RKDeviceConnectionOnlineNotification object:nil];
//    if ([[RKRobotProvider sharedRobotProvider] isRobotUnderControl]) {
//        [[RKRobotProvider sharedRobotProvider] openRobotConnection];        
//    }
//}

- (void)navigate {
//    [timer invalidate];
    
    // Navigation Logic
    if(self.shakeViewController == nil) {
        ShakeViewController *shakeView = [[ShakeViewController alloc] initWithNibName:@"ShakeView" bundle:nil];
        self.shakeViewController = shakeView;
        [shakeView release];
    }
    [self presentModalViewController:self.shakeViewController animated:YES];
    
}

-(IBAction)navigateToShakeView:(id)sender{
//    [self navigate];
}

- (void)shakeDetected:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"shake" object:nil];
	[self navigate];
}

@end
