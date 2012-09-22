//
//  SetupViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RollingViewController.h"

@interface SetupViewController : UIViewController{
UIImage* photo;
UIImage* backgroundPhoto;
IBOutlet UIImageView *imageView;
UIImageView *backgroundImageView;
    IBOutlet UILabel *setupLabel;
    
    UISplitViewController *rollingViewController;
}

@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) UIImageView *backgroundImageView;
@property(nonatomic, retain) UIImage *photo;
@property(nonatomic, retain) UIImage *backgroundPhoto;

@property(nonatomic, retain) UISplitViewController *rollingViewController;
@property(nonatomic, retain) IBOutlet UILabel *setupLabel;
@end
