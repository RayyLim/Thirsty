//
//  ResultViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TippsyRule.h"
#import "SetupViewController.h"

@interface ResultViewController : UIViewController
{
    UIView *descriptionView;
    UILabel *descriptionTitleLabel;
    UITextView *descriptionTextLabel;
    UIImage* dialogBackgroundPhoto;
    UIImageView *dialogBackgroundImageView;
    IBOutlet UILabel *shakeLabel;
    IBOutlet UILabel *ruleLabel;
    
    UIImage* colorPhoto;
    UIImage* messagePhoto;
    UIImage* messageBackgroundPhoto;
    
    IBOutlet UIImageView *colorImageView;
    IBOutlet UIImageView *messageImageView;
    IBOutlet UIImageView *messageBackgroundImageView;
    IBOutlet UIButton *infoButton;
}

@property(nonatomic, retain) UIView *descriptionView;
@property(nonatomic, retain) UILabel *descriptionTitleLabel;
@property(nonatomic, retain) UITextView *descriptionTextLabel;
@property(nonatomic, retain) UIImage* dialogBackgroundPhoto;
@property(nonatomic, retain) UIImageView *dialogBackgroundImageView;
@property(nonatomic, retain) IBOutlet UILabel *shakeLabel;
@property(nonatomic, retain) IBOutlet UILabel *ruleLabel;
@property(nonatomic, retain) IBOutlet UIImageView *colorImageView;
@property(nonatomic, retain) IBOutlet UIImageView *messageImageView;
@property(nonatomic, retain) IBOutlet UIImageView *messageBackgroundImageView;
@property(nonatomic, retain) IBOutlet UIButton *infoButton;

- (IBAction) showInfoDialog:(id) sender;
- (IBAction) hideInfoDialog:(id) sender;
@end
