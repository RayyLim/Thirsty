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

@synthesize txtName, lblHello;

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

-(IBAction)updateText:(id)sender{
    NSString *text;
    if([txtName.text length] == 0)
    {
        text = @"Please enter your name";
    }
    else
    {
        text = [[NSString alloc] initWithFormat:@"Hello %@!", txtName.text];
    }
    
    lblHello.text = text;
    
    [text release];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if(theTextField == self.txtName)
    {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

@end
