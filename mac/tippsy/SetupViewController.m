//
//  SetupViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController () {
        NSTimer* timer;
}

@end

@implementation SetupViewController

@synthesize imageView, photo, rollingViewController, setupLabel;

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
    
    self.photo = [UIImage imageNamed:@"set_sphero"];    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.imageView addGestureRecognizer:tapGesture];
    [tapGesture release];
    
    self.setupLabel.numberOfLines = 2;
    self.setupLabel.text = @"Game ends after everyone gets tippsy";
    self.setupLabel.textColor=[UIColor whiteColor];
    [self.setupLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:24]];
    self.setupLabel.backgroundColor=[UIColor clearColor];
   
    timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(navigate) userInfo:nil repeats:NO];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)navigate {
    [timer invalidate];
    
    // Navigation Logic
    if(self.rollingViewController == nil) {
        self.rollingViewController = [[RollingViewController alloc] initWithNibName:@"RollingViewController" bundle:nil];
    }
    [self presentModalViewController:self.rollingViewController animated:YES];
    
}

@end
