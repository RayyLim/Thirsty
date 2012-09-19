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
    
}

- (IBAction) hideInfoDialog:(id) sender
{
    
}

@end
