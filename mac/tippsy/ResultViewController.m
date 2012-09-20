//
//  ResultViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "ResultViewController.h"
#import "SharedModel.h"

@interface ResultViewController () {
    int ruleCount;
}
@end

@implementation ResultViewController {
    NSArray *colorArray;
}

@synthesize descriptionView, dialogBackgroundImageView, dialogBackgroundPhoto, descriptionTitleLabel, descriptionTextLabel, shakeLabel, ruleLabel, colorImageView, messageImageView, messageBackgroundImageView, infoButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        ruleCount = 0;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:");
    //    _sv.frame = CGRectMake(0.0, 0.0, 320.0, self.view.bounds.size.height);
    
//    [self.imageView startAnimating];


}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    

    
    int rulePosition = arc4random() % [[[SharedModel sharedModel] colorArray] count];

    TippsyRule *rule = [[SharedModel sharedModel] getRule:rulePosition];
    
    [[SharedModel sharedModel] setLED:rule.red:rule.green:rule.blue];
    self.descriptionTitleLabel.text = rule.drinkingRule;
    self.descriptionTextLabel.text = rule.description;
    
    self.shakeLabel.text = [[SharedModel sharedModel] bottomMessage];
    [self.colorImageView setImage:[UIImage imageNamed:rule.color ]];
        [self.messageBackgroundImageView setImage:[UIImage imageNamed:rule.messagebg ]];
        [self.messageImageView setImage:[UIImage imageNamed:rule.message]];
    self.ruleLabel.text = rule.drinkingRule;
    if(rule.description.length == 0)
    {
        infoButton.hidden = YES;
    }
    else
    {
        infoButton.hidden = NO;
    }
    
    ruleCount = (ruleCount + 1)%[[[SharedModel sharedModel] colorArray] count];

//        [rule release];
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    
    [self.ruleLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:16]];
    [self.shakeLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:26]];
    
    self.descriptionView = [[UIView alloc] init];
    
    UIView *overlay = [[UIView alloc] init];
    overlay.alpha = (CGFloat)0.5;
    overlay.backgroundColor = [UIColor blackColor];
    //    CGRect descpriptionViewFrame = self.view.frame;
    overlay.frame = self.view.frame;
    [self.descriptionView addSubview:overlay];
    [overlay release];
    
    self.dialogBackgroundPhoto = [UIImage imageNamed:@"dialogbackground"];
    self.dialogBackgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 275.0f, 380.0f)];
    [self.dialogBackgroundImageView setImage:dialogBackgroundPhoto];
    [self.descriptionView addSubview:dialogBackgroundImageView];
    self.dialogBackgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.dialogBackgroundImageView.center = self.view.center;
    
    self.descriptionTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 225.0f, 40.0f)];
    self.descriptionTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.descriptionTitleLabel.numberOfLines = 0;
    self.descriptionTitleLabel.text = @"Rule Title";
    self.descriptionTitleLabel.textColor=[UIColor whiteColor];
    [self.descriptionTitleLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:28]];
    self.descriptionTitleLabel.backgroundColor=[UIColor clearColor];
    [self.descriptionView addSubview:descriptionTitleLabel];
    
    self.descriptionTitleLabel.center = self.view.center;
    CGRect descriptionTitleLabelFrame = self.descriptionTitleLabel.frame;
    descriptionTitleLabelFrame.origin.y = 60;
    
    self.descriptionTitleLabel.frame = descriptionTitleLabelFrame;
    self.descriptionTitleLabel.textAlignment = UITextAlignmentCenter;
    
    self.descriptionTextLabel= [[UITextView alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 240.0f, 250.0f)];
//    self.descriptionTextLabel.lineBreakMode = UILineBreakModeWordWrap;
//    self.descriptionTextLabel.numberOfLines = 0;

    self.descriptionTextLabel.editable = NO;
    
    
    
    self.descriptionTextLabel.text = @"World";
    self.descriptionTextLabel.textColor=[UIColor whiteColor];
    [self.descriptionTextLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:14]];
    self.descriptionTextLabel.backgroundColor=[UIColor clearColor];
    [self.descriptionView addSubview:descriptionTextLabel];
    
    self.descriptionTextLabel.center = self.view.center;
    CGRect descriptionTextLabelFrame = self.descriptionTextLabel.frame;
    descriptionTextLabelFrame.origin.y = 100;
    
    self.descriptionTextLabel.frame = descriptionTextLabelFrame;
    self.descriptionTextLabel.textAlignment = UITextAlignmentLeft;
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
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction) showInfoDialog:(id) sender
{
    [self.view addSubview:descriptionView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(hideInfoDialog:)
     forControlEvents:UIControlEventTouchDown];
//    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = self.view.frame;
    [self.view addSubview:button];
}

- (IBAction) hideInfoDialog:(id) sender
{
    [self.descriptionView removeFromSuperview];
    [sender removeFromSuperview];
}

@end
