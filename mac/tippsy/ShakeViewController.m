//
//  ShakeViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "ShakeViewController.h"
#import "SharedModel.h"

@interface ShakeViewController ()

@end

@implementation ShakeViewController

@synthesize imageView, photo, backgroundImageView, backgroundPhoto, setupViewController;

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
    
    SharedModel *sharedModel = [SharedModel sharedModel];
    sharedModel.listeningForShake = YES;
    
    self.photo = [UIImage imageNamed:@"shake_message"];
    self.backgroundPhoto = [UIImage imageNamed:@"background"];
    
    CGSize photoSize = [photo size];
    
//    self.backgroundImageView = [[UIImageView alloc] init];
//    [self.backgroundImageView setImage:backgroundPhoto];
//    [self.view addSubview:backgroundImageView];
//    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
//    self.backgroundImageView.frame = self.view.frame;
//    self.backgroundImageView.center = self.view.center;
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shakeDetected:) name:@"shake" object:nil];
    [[SharedModel sharedModel] startListeningForShake];
    
    
}

- (void)navigate
{
    // Navigation Logic
    if(self.setupViewController == nil) {
        SetupViewController *setupView = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
        self.setupViewController = setupView;
        [setupView release];
    }
    [self presentModalViewController:self.setupViewController animated:YES];
}

- (void)handleTap: (UITapGestureRecognizer *)sender
{
    
    [self navigate];
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

- (void)shakeDetected:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"shake" object:nil];
    SharedModel *sharedModel = [SharedModel sharedModel];
    sharedModel.listeningForShake = NO;
	[self navigate];
}

@end
