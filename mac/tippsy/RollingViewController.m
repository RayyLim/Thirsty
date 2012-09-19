//
//  RollingViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "RollingViewController.h"
#import "TippsyRule.h"

@interface RollingViewController () {
    NSArray *colorArray;
    }

@end

@implementation RollingViewController

@synthesize imageView, photo, backgroundImageView, backgroundPhoto, resultView, colorPhoto, messagePhoto, messageBackgroundPhoto, infoPhoto, colorImageView, messageBackgroundImageView, messageImageView, infoImageView, ruleLabel, shakeLabel, descriptionView, descriptionTextLabel, descriptionTitleLabel, dialogBackgroundImageView, dialogBackgroundPhoto, animationView, resultViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    return self;
}

- (void)setImage: (UIView *)container :(UIImage *)setPhoto :(UIImageView *)setImageView :(NSString *)photoString :(int)imageWidth :(int)imageHeight :(int)x :(int)y 
{
    CGSize photoSize;
//    CGRect frame;
    setPhoto = [UIImage imageNamed:photoString];
    photoSize = [setPhoto size];
    setImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight)];
//    setImageView = [[UIImageView alloc] init];

    [setImageView setImage:setPhoto];
    [container addSubview:setImageView];
    setImageView.contentMode = UIViewContentModeScaleAspectFill;
    //change width of frame
//    frame = colorImageView.frame;
//    frame.size.width = imageWidth;
//    frame.size.height = imageHeight;
//    setImageView.frame = frame;
    
//    if(center)
//    {

    setImageView.center = self.view.center;
//        setImageView.center = self.view.center.x;
//    }
    
    CGRect frame = setImageView.frame;
    if(x != -1)
    {
        frame.origin.x = x;
    }
    frame.origin.y = y;
    setImageView.frame = frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:");
//    _sv.frame = CGRectMake(0.0, 0.0, 320.0, self.view.bounds.size.height);
    
    [self.imageView startAnimating];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(handleButtonTap:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = self.view.frame;
    [self.view addSubview:button];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
    
//    self.photo = [UIImage imageNamed:@"animation001"];
//    CGSize photoSize = [photo size];
    
    self.photo = [UIImage imageNamed:@"animation0001"];
//    self.backgroundPhoto = [UIImage imageNamed:@"background"];
    self.dialogBackgroundPhoto = [UIImage imageNamed:@"dialogbackground"];
    
    CGSize photoSize = [photo size];
//
////    self.backgroundImageView = [[UIImageView alloc] init];
////    [self.backgroundImageView setImage:backgroundPhoto];
////    [self.view addSubview:backgroundImageView];
////    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
////    self.backgroundImageView.frame = self.view.frame;
////    self.backgroundImageView.center = self.view.center;
//    
//    self.animationView = [[UIView alloc] init];
//    [self.view addSubview:animationView];
//    
    
    NSArray *animationImages = [NSArray arrayWithObjects:
                                [UIImage imageNamed:@"animation0001"],
                                [UIImage imageNamed:@"animation0002"],
                                [UIImage imageNamed:@"animation0003"],
                                [UIImage imageNamed:@"animation0004"],
                                [UIImage imageNamed:@"animation0005"],
                                [UIImage imageNamed:@"animation0006"],
                                [UIImage imageNamed:@"animation0007"],
                                [UIImage imageNamed:@"animation0008"],
                                [UIImage imageNamed:@"animation0009"],
                                [UIImage imageNamed:@"animation0010"],
                                [UIImage imageNamed:@"animation0011"],
                                [UIImage imageNamed:@"animation0012"],
                                [UIImage imageNamed:@"animation0013"],
                                [UIImage imageNamed:@"animation0014"],
                                [UIImage imageNamed:@"animation0015"],
                                [UIImage imageNamed:@"animation0016"],
                                [UIImage imageNamed:@"animation0017"],
                                [UIImage imageNamed:@"animation0018"],
                                [UIImage imageNamed:@"animation0019"],
                                [UIImage imageNamed:@"animation0020"],
                                [UIImage imageNamed:@"animation0021"],
                                [UIImage imageNamed:@"animation0022"],
                                [UIImage imageNamed:@"animation0023"],
                                [UIImage imageNamed:@"animation0024"],
                                nil];
    // Create the image view.
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 250, photoSize.height)];
//    [self.imageView setImage:photo];
    self.imageView.animationImages = animationImages;
    self.imageView.animationDuration = 1.25; // seconds
    self.imageView.animationRepeatCount = 0; // 0 = loops forever
    [self.imageView startAnimating];
    [self.view addSubview:imageView];

    //set contentMode to scale aspect to fit
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
//    //change width of frame
//    CGRect frame = imageView.frame;
//    frame.size.width = 200;
//    imageView.frame = frame;
    
    self.imageView.center = self.view.center;
//
//    self.imageView.userInteractionEnabled = YES;
////        self.animationView.userInteractionEnabled = NO;
////    self.imageView.exclusiveTouch = YES;
//    
//       
//    self.resultView = [[UIView alloc] init];
//    [self.view addSubview:resultView];
//    
// 
//
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    [self.imageView addGestureRecognizer:tapGesture];
//
//    
//    [tapGesture release];
//
//    
//    
//
////    [self setImage:self.resultView:self.colorPhoto:self.colorImageView:@"color_red":200:50:self.view.center.x:self.view.center.y];
////        [self setImage:self.resultView:self.messageBackgroundPhoto:self.messageBackgroundImageView:@"messagebg_categories":200:50:self.view.center.x:self.view.center.y];
////        [self setImage:self.resultView:self.messagePhoto:self.messageImageView:@"message_categories":200:50:self.view.center.x:self.view.center.y];
////    [self setImage:self.resultView:self.infoPhoto:self.infoImageView:@"info_icon":200:50:0:0];
//    int width = 225;
//    TippsyRule *rule = [colorArray objectAtIndex:1];
//    [self setImage:self.resultView:self.colorPhoto:self.colorImageView:rule.color:width:50:-1:90];
//    [self setImage:self.resultView:self.messageBackgroundPhoto:self.messageBackgroundImageView:rule.messagebg:width:50:-1:250];
//    [self setImage:self.resultView:self.messagePhoto:self.messageImageView:rule.message:width:50:-1:233];
//    if(rule.description.length != 0)
//    {
//
//        [self setImage:self.resultView:self.infoPhoto:self.infoImageView:@"info_icon":40:40:230:340];
////                    self.infoImageView.userInteractionEnabled = YES;
////        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleInfo:)];
////        [self.infoImageView addGestureRecognizer:tapGesture2];
////        
////        [tapGesture2 release];
//        
//    }
//    
//    self.ruleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 150.0f, 38.0f)];
//    self.ruleLabel.lineBreakMode = UILineBreakModeWordWrap;
//
//    self.ruleLabel.numberOfLines = 2;
//    self.ruleLabel.text = rule.rule;
//    self.ruleLabel.textColor=[UIColor whiteColor];
//    [self.ruleLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:14]];
//    self.ruleLabel.backgroundColor=[UIColor clearColor];
//    [self.resultView addSubview:ruleLabel];
//
//
////    [self.ruleLabel sizeToFit];
//        self.ruleLabel.center = self.view.center;
//    CGRect ruleLabelFrame = self.ruleLabel.frame;
//    ruleLabelFrame.origin.y = 344;
//    
//    self.ruleLabel.frame = ruleLabelFrame;
//        self.ruleLabel.textAlignment = UITextAlignmentCenter;
////    rule.description = @"";
////    if(rule.description.length == 0)
////    {
////        self.infoImageView.hidden = YES;
////    [self.infoImageView removeFromSuperview];
//    
////    }
////    else
////    {
////        self.infoImageView.hidden = NO;
////    }
//    
//    self.shakeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 300.0f, 40.0f)];
//    self.shakeLabel.lineBreakMode = UILineBreakModeWordWrap;
//    self.shakeLabel.numberOfLines = 10;
//    self.shakeLabel.text = @"Pass and shake";
//    self.shakeLabel.textColor=[UIColor whiteColor];
//    [self.shakeLabel setFont:[UIFont fontWithName:@"LubalinGraph LT" size:26]];
//    self.shakeLabel.backgroundColor=[UIColor clearColor];
//    [self.resultView addSubview:shakeLabel];
//    
//    self.shakeLabel.center = self.view.center;
//    CGRect shakeLabelFrame = self.shakeLabel.frame;
//    shakeLabelFrame.origin.y = 400;
//    
//    self.shakeLabel.frame = shakeLabelFrame;
//    self.shakeLabel.textAlignment = UITextAlignmentCenter;
//    
//    self.resultView.hidden = YES;
//    
//    self.descriptionView.hidden = YES;
    
//    self.view.userInteractionEnabled = YES;
//
//    self.descriptionView.userInteractionEnabled = YES;
//    self.infoImageView.userInteractionEnabled = YES;
//    
//    UITapGestureRecognizer *tapInfoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
//    [self.infoImageView addGestureRecognizer:tapInfoGesture];
//    //    [self.descriptionView addGestureRecognizer:tapInfoGesture];
//    [tapInfoGesture release];
    

    
}
//
//- (void)handleTap: (UITapGestureRecognizer *)sender
//{
//    [self.imageView stopAnimating];
//    
//        // Navigation Logic
//        if(self.resultViewController == nil) {
//            ResultViewController *nextView = [[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil];
//            self.resultViewController = nextView;
//            [nextView release];
//        }
//        [self.navigationController pushViewController:self.resultViewController animated:YES];
//    
//    //    if(self.imageView.isAnimating)
//    //    {
//    //        //        [self.view addSubview:resultView];
//    ////        [self.view addSubview:infoImageView];
//    //               self.resultView.hidden = NO;
//    ////        [self.imageView removeFromSuperview];
//    //
//    //
//    //    }
//    //    else
//    //    {
//    //        //        self.animationView.hidden = NO;
//    //        [self.imageView startAnimating];
//    //        self.resultView.hidden = YES;
//    //
//    //
//}

//- (void)toggleInfo: (UITapGestureRecognizer *)sender
//{
//    if(self.descriptionView.isHidden)
//    {
//        self.descriptionView.hidden = NO;
//    }
//    else
//    {
//        self.descriptionView.hidden = YES;
//    }
//}
    
    
//    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, photoSize.width, photoSize.height)];
//    [self.imageView setImage:photo];
    
//    [self.view addSubview:imageView];
//    [self.imageView release];
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

- (IBAction)handleButtonTap: (id)sender{
    
    
        [self.imageView stopAnimating];
    
    // Navigation Logic
    if(self.resultViewController == nil) {
        ResultViewController *nextView = [[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil];
        self.resultViewController = nextView;
        [nextView release];
    }
    [self presentModalViewController:self.resultViewController animated:NO];
    [sender removeFromSuperview];

    
//    [self.imageView ]
//    [sender removeFromSuperview];
    
//    if(self.imageView.isAnimating)
//    {
//        //        [self.view addSubview:resultView];
////        [self.view addSubview:infoImageView];
//               self.resultView.hidden = NO;
////        [self.imageView removeFromSuperview];
//        
//        
//    }
//    else
//    {
//        //        self.animationView.hidden = NO;
//        [self.imageView startAnimating];
//        self.resultView.hidden = YES;
//
//        
    }



@end
