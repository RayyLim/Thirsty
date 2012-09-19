//
//  ResultViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController () 

@end

@implementation ResultViewController

@synthesize descriptionView, dialogBackgroundImageView, dialogBackgroundPhoto, descriptionTitleLabel, descriptionTextLabel;

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
    // Do any additional setup after loading the view from its nib.
    
    self.descriptionView = [[UIView alloc] init];
    
    //    self.descriptionView.alpha = (CGFloat)0.5;
    //    self.descriptionView.backgroundColor = [UIColor blackColor];
    ////    CGRect descpriptionViewFrame = self.view.frame;
    //    self.descriptionView.frame = self.view.frame;
    
    UIView *overlay = [[UIView alloc] init];
    overlay.alpha = (CGFloat)0.5;
    overlay.backgroundColor = [UIColor blackColor];
    //    CGRect descpriptionViewFrame = self.view.frame;
    overlay.frame = self.view.frame;
    [self.descriptionView addSubview:overlay];
    [overlay release];
    
    self.dialogBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 275.0f, 380.0f)];
    [self.dialogBackgroundImageView setImage:dialogBackgroundPhoto];
    [self.descriptionView addSubview:dialogBackgroundImageView];
    self.dialogBackgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.dialogBackgroundImageView.center = self.view.center;
    
    self.descriptionTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 225.0f, 40.0f)];
    self.descriptionTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.descriptionTitleLabel.numberOfLines = 0;
//    self.descriptionTitleLabel.text = rule.rule;
    self.descriptionTitleLabel.text = @"Hello";
    self.descriptionTitleLabel.textColor=[UIColor whiteColor];
    [self.descriptionTitleLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:28]];
    self.descriptionTitleLabel.backgroundColor=[UIColor clearColor];
    [self.descriptionView addSubview:descriptionTitleLabel];
    
    self.descriptionTitleLabel.center = self.view.center;
    CGRect descriptionTitleLabelFrame = self.descriptionTitleLabel.frame;
    descriptionTitleLabelFrame.origin.y = 60;
    
    self.descriptionTitleLabel.frame = descriptionTitleLabelFrame;
    self.descriptionTitleLabel.textAlignment = UITextAlignmentCenter;
    
    self.descriptionTextLabel= [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 225.0f, 200.0f)];
    self.descriptionTextLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.descriptionTextLabel.numberOfLines = 0;
//    self.descriptionTextLabel.text = rule.description;
    self.descriptionTextLabel.text = @"World";
    self.descriptionTextLabel.textColor=[UIColor whiteColor];
    [self.descriptionTextLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:16]];
    self.descriptionTextLabel.backgroundColor=[UIColor clearColor];
    [self.descriptionView addSubview:descriptionTextLabel];
    
    self.descriptionTextLabel.center = self.view.center;
    CGRect descriptionTextLabelFrame = self.descriptionTextLabel.frame;
    descriptionTextLabelFrame.origin.y = 110;
    
    self.descriptionTextLabel.frame = descriptionTextLabelFrame;
    self.descriptionTextLabel.textAlignment = UITextAlignmentLeft;
    
    
    
//    [self.view addSubview:descriptionView];

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

- (IBAction) navigateToRollingViewContainer:(id) sender{

    
    // Navigation Logic
//    if(self.rollingViewController == nil) {
//        RollingViewController *nextView = [[RollingViewController alloc] initWithNibName:@"RollingViewController" bundle:nil];
//        self.rollingViewController = nextView;
//        [nextView release];
//    }
//    [self presentModalViewController:self.rollingViewController animated:YES];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) showInfoDialog:(id) sender
{
    [self.view addSubview:descriptionView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(hideInfoDialog:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = self.view.frame;
    [self.view addSubview:button];
}

- (IBAction) hideInfoDialog:(id) sender
{
    [self.descriptionView removeFromSuperview];
    [sender removeFromSuperview];
}

@end
