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

@synthesize imageView, photo, backgroundImageView, backgroundPhoto, rollingViewController, setupLabel;

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
    self.backgroundPhoto = [UIImage imageNamed:@"background"];
    
    CGSize photoSize = [photo size];
    
//    self.backgroundImageView = [[UIImageView alloc] init];
//    [self.backgroundImageView setImage:backgroundPhoto];
//    [self.view addSubview:backgroundImageView];
//    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.backgroundImageView.frame = self.view.frame;
//    self.backgroundImageView.center = self.view.center;
//    
//    // Create the image view.
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 225, photoSize.height)];
//    [self.imageView setImage:photo];
//    [self.view addSubview:imageView];
//    
//    //set contentMode to scale aspect to fit
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    
//    self.imageView.center = self.view.center;
//    //change width of frame
//    CGRect frame = imageView.frame;
//
//    
//    frame.origin.y = imageView.frame.origin.y - 35;
//    imageView.frame = frame;
//    
   
    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.imageView addGestureRecognizer:tapGesture];
    [tapGesture release];
    
//    self.setupLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 300.0f, 80.0f)];
//    self.setupLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.setupLabel.numberOfLines = 2;
    self.setupLabel.text = @"Game ends after everyone gets tippsy";
    self.setupLabel.textColor=[UIColor whiteColor];
    [self.setupLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:24]];
    self.setupLabel.backgroundColor=[UIColor clearColor];
//    [self.view addSubview:setupLabel];
//    
//    self.setupLabel.center = self.view.center;
//    CGRect setupLabelFrame = self.setupLabel.frame;
//    setupLabelFrame.origin.y = 330;
    
//    self.setupLabel.frame = setupLabelFrame;
//    self.setupLabel.textAlignment = UITextAlignmentCenter;
    
            timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(navigate) userInfo:nil repeats:NO];
    
}

//- (void)handleTap: (UITapGestureRecognizer *)sender
//{
//    [self navigate];
//}

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
        RollingViewController *rollingView = [[RollingViewController alloc] initWithNibName:@"RollingViewController" bundle:nil];
        self.rollingViewController = rollingView;
        [rollingView release];
    }
    [self presentModalViewController:self.rollingViewController animated:YES];
    
}

@end
