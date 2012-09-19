//
//  SwitchViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@end

@implementation SwitchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.rollingViewController = [[RollingViewController alloc]
                               initWithNibName:@"RollingViewController" bundle:nil];
    [self.view insertSubview:self.rollingViewController.view atIndex:0];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//1. remove yellow view and insert blue view
- (IBAction)switchViews:(id)sender {
    if (self.resultViewController == nil)
    {
        ResultViewController *resultViewController = [[ResultViewController alloc]
                                                  initWithNibName:@"ResultViewController" bundle:nil];
        self.resultViewController = resultViewController;
        [resultViewController release];
    }
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    UIViewController *coming = nil;
    UIViewController *going = nil;
    UIViewAnimationTransition transition;
    
    if (self.rollingViewController.view.superview == nil)
    {
        coming = rollingViewController;
        going = resultViewController;
        transition = UIViewAnimationTransitionFlipFromLeft;
    }
    else
    {
        coming = resultViewController;
        going = rollingViewController;
        transition = UIViewAnimationTransitionFlipFromRight;
    }
    
    [UIView setAnimationTransition: transition forView:self.view cache:YES];
    [coming viewWillAppear:YES];
    [going viewWillDisappear:YES];
    [going.view removeFromSuperview];
    [self.view insertSubview: coming.view atIndex:0];
    [going viewDidDisappear:YES];
    [coming viewDidAppear:YES];
    
    [UIView commitAnimations];
    
}

@end
