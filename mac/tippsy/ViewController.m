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

@implementation ViewController {
    NSTimer* timer;
}

@synthesize shakeViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(navigate) userInfo:nil repeats:NO];
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

- (void)navigate {
    [timer invalidate];
    
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
