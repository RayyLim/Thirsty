//
//  ShakeViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetupViewController.h"

@interface ShakeViewController : UIViewController {
    UIImage* photo;
    UIImageView *imageView;
    
    SetupViewController *setupViewController;
}

@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, retain) UIImage *photo;

@property(nonatomic, retain) SetupViewController *setupViewController;

@end


