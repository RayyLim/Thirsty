//
//  ResultViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RollingViewController.h"

@interface ResultViewController : UIViewController
{
    UIView *descriptionView;
    UILabel *descriptionTitleLabel;
    UILabel *descriptionTextLabel;
     UIImage* dialogBackgroundPhoto;
        UIImageView *dialogBackgroundImageView;
}

//@property(nonatomic, retain) RollingViewController *rollingViewController;
@property(nonatomic, retain) UIView *descriptionView;
@property(nonatomic, retain) UILabel *descriptionTitleLabel;
@property(nonatomic, retain) UILabel *descriptionTextLabel;
@property(nonatomic, retain) UIImage* dialogBackgroundPhoto;
@property(nonatomic, retain) UIImageView *dialogBackgroundImageView;

- (IBAction) navigateToRollingViewContainer:(id) sender;
- (IBAction) showInfoDialog:(id) sender;
- (IBAction) hideInfoDialog:(id) sender;
@end
