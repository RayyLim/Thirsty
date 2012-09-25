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

@implementation ViewController
{
    NSTimer* timer;
}

@synthesize shakeViewController;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    calibrateHandler = [[RUICalibrateGestureHandler alloc] initWithView:self.view];
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startTimer:) name:@"connected" object:nil];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)startTimer:(NSNotification *)notification
{
    if(timer == nil)
    {
            timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(navigate) userInfo:nil repeats:NO];
    }
}

- (void)navigate
{
   [timer invalidate];
    timer = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"connected" object:nil];
    
    // Navigation Logic
    if(self.shakeViewController == nil) {
        ShakeViewController *shakeView = [[ShakeViewController alloc] initWithNibName:@"ShakeView" bundle:nil];
        self.shakeViewController = shakeView;
        [shakeView release];
    }
    [self presentModalViewController:self.shakeViewController animated:YES];  
}

-(IBAction)navigateToShakeView:(id)sender{
    [self navigate];
}



@end
