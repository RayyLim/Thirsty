//
//  SetupViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

@synthesize imageView, photo, backgroundImageView, backgroundPhoto, rollingViewController;

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
    
    self.backgroundImageView = [[UIImageView alloc] init];
    [self.backgroundImageView setImage:backgroundPhoto];
    [self.view addSubview:backgroundImageView];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.frame = self.view.frame;
    self.backgroundImageView.center = self.view.center;
    
    // Create the image view.
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, photoSize.width, photoSize.height)];
    [self.imageView setImage:photo];
    [self.view addSubview:imageView];
    
    //set contentMode to scale aspect to fit
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //change width of frame
    CGRect frame = imageView.frame;
    frame.size.width = 200;
    imageView.frame = frame;
    
    self.imageView.center = self.view.center;
    
    self.imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.imageView addGestureRecognizer:tapGesture];
    [tapGesture release];
    
    
}

- (void)handleTap: (UITapGestureRecognizer *)sender
{
    // Navigation Logic
    if(self.rollingViewController == nil) {
        RollingViewController *rollingView = [[RollingViewController alloc] initWithNibName:@"RollingViewController" bundle:nil];
        self.rollingViewController = rollingView;
        [rollingView release];
    }
    [self presentModalViewController:self.rollingViewController animated:YES];
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

@end