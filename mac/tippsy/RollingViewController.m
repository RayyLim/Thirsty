//
//  RollingViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "RollingViewController.h"

@interface RollingViewController ()

@end

@implementation RollingViewController

@synthesize imageView, photo, backgroundImageView, backgroundPhoto, resultView, colorPhoto, messagePhoto, messageBackgroundPhoto, infoPhoto, colorImageView, messageBackgroundImageView, messageImageView, infoImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setImage: (UIView *)container :(UIImage *)setPhoto :(UIImageView *)setImageView :(NSString *)photoString :(int)imageWidth :(int)imageHeight :(int)x :(int)y
{
    CGSize photoSize;
    CGRect frame;
    setPhoto = [UIImage imageNamed:photoString];
    photoSize = [setPhoto size];
    setImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight)];

    [setImageView setImage:setPhoto];
    [self.resultView addSubview:setImageView];
    setImageView.contentMode = UIViewContentModeScaleAspectFill;
    //change width of frame
//    frame = colorImageView.frame;
//    frame.size.width = imageWidth;
//    frame.size.height = imageHeight;
//    setImageView.frame = frame;
//    setImageView.center = self.view.center;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.photo = [UIImage imageNamed:@"animation001"];
//    CGSize photoSize = [photo size];
    
    self.photo = [UIImage imageNamed:@"animation0001"];
    self.backgroundPhoto = [UIImage imageNamed:@"background"];
    
    CGSize photoSize = [photo size];
    
    self.backgroundImageView = [[UIImageView alloc] init];
    [self.backgroundImageView setImage:backgroundPhoto];
    [self.view addSubview:backgroundImageView];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.frame = self.view.frame;
    self.backgroundImageView.center = self.view.center;
    
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
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, photoSize.width, photoSize.height)];
//    [self.imageView setImage:photo];
    self.imageView.animationImages = animationImages;
    self.imageView.animationDuration = 1.25; // seconds
    self.imageView.animationRepeatCount = 0; // 0 = loops forever
    [self.imageView startAnimating];
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
    
    self.resultView = [[UIView alloc] init];
    [self.view addSubview:resultView];

    [self setImage:self.resultView:self.colorPhoto:self.colorImageView:@"color_red":200:50:self.view.center.x:self.view.center.y];
        [self setImage:self.resultView:self.messageBackgroundPhoto:self.messageBackgroundImageView:@"messagebg_categories":200:50:self.view.center.x:self.view.center.y];
        [self setImage:self.resultView:self.messagePhoto:self.messageImageView:@"message_categories":200:50:self.view.center.x:self.view.center.y];
    [self setImage:self.resultView:self.infoPhoto:self.infoImageView:@"info_icon":200:50:0:0];
    self.resultView.hidden = YES;
    

    
}

- (void)handleTap: (UITapGestureRecognizer *)sender
{
    if(self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
        self.resultView.hidden = NO;
    }
    else
    {
        [self.imageView startAnimating];
        self.resultView.hidden = YES;
    }
}

    
    
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

@end