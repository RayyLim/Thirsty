//
//  RollingViewController.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "RollingViewController.h"
#import "SharedModel.h"

@interface RollingViewController () 

@end

@implementation RollingViewController

@synthesize imageView, photo, resultViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
  
    }
    return self;
}

- (void)setImage: (UIView *)container :(UIImage *)setPhoto :(UIImageView *)setImageView :(NSString *)photoString :(int)imageWidth :(int)imageHeight :(int)x :(int)y 
{
    CGSize photoSize;
    setPhoto = [UIImage imageNamed:photoString];
    photoSize = [setPhoto size];
    setImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight)];

    [setImageView setImage:setPhoto];
    [container addSubview:setImageView];
    setImageView.contentMode = UIViewContentModeScaleAspectFill;

    setImageView.center = self.view.center;
    
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
   
    [self.imageView startAnimating];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rollfinished:) name:@"rollfinished" object:nil];
    [self performSelectorInBackground:@selector(spin) withObject:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.photo = [UIImage imageNamed:@"animation0001"];

    CGSize photoSize = [photo size];
  
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
    self.imageView.animationImages = animationImages;
    self.imageView.animationDuration = 1.25; // seconds
    self.imageView.animationRepeatCount = 0; // 0 = loops forever
    [self.imageView startAnimating];
    [self.view addSubview:imageView];

    //set contentMode to scale aspect to fit
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    

    self.imageView.center = self.view.center;
}

-(void)spin
{
    [[SharedModel sharedModel] spin];
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

- (void)navigate {
    [self.imageView stopAnimating];
    
    // Navigation Logic
    if(self.resultViewController == nil) {
        self.resultViewController = [[ResultViewController alloc] initWithNibName:@"ResultViewController" bundle:nil];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
            [self presentModalViewController:self.resultViewController animated:NO];
    });

}

- (void)rollfinished:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"rollfinished" object:nil];
	[self navigate];
}

@end
