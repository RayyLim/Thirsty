//
//  ViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize shakeViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)navigateToShakeView:(id)sender{  
    // Navigation Logic
    if(self.shakeViewController == nil) {
        ShakeViewController *shakeView = [[ShakeViewController alloc] initWithNibName:@"ShakeView" bundle:nil];
        self.shakeViewController = shakeView;
        [shakeView release];
    }
                                          [self presentModalViewController:self.shakeViewController animated:YES];
}

@end
