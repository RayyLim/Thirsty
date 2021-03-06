//
//  RollingViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultViewController.h"

@interface RollingViewController : UIViewController {
    UIImage* photo;
    UIImageView *imageView;    
    UISplitViewController *resultViewController;
}

@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, retain) UIImage *photo;
@property(nonatomic, retain) UISplitViewController *resultViewController;

@end
