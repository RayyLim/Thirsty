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
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *setupLabel;
    
    UISplitViewController *rollingViewController;
}

@property(nonatomic, retain) IBOutlet UIImageView *imageView;
@property(nonatomic, retain) UIImage *photo;

@property(nonatomic, retain) UISplitViewController *rollingViewController;
@property(nonatomic, retain) IBOutlet UILabel *setupLabel;
@end
