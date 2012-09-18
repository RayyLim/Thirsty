//
//  RollingViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RollingViewController : UIViewController {
    UIImage* photo;
    UIImage* backgroundPhoto;
    UIImageView *imageView;
    UIImageView *backgroundImageView;
    
    UIView *resultView;
    UIImage* colorPhoto;
    UIImage* messagePhoto;
    UIImage* messageBackgroundPhoto;
    UIImage* infoPhoto;
    
    UIImageView *colorImageView;
    UIImageView *messageImageView;
    UIImageView *messageBackgroundImageView;
    UIImageView *infoImageView;
    
    UILabel *ruleLabel;
        UILabel *shakeLabel;
}

@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, retain) UIImageView *backgroundImageView;
@property(nonatomic, retain) UIImage *photo;
@property(nonatomic, retain) UIImage *backgroundPhoto;
@property(nonatomic, retain) UIView *resultView;
@property(nonatomic, retain) UIImage* colorPhoto;
@property(nonatomic, retain) UIImage* messagePhoto;
@property(nonatomic, retain) UIImage* messageBackgroundPhoto;
@property(nonatomic, retain) UIImage* infoPhoto;
@property(nonatomic, retain) UIImageView *colorImageView;
@property(nonatomic, retain) UIImageView *messageImageView;
@property(nonatomic, retain) UIImageView *messageBackgroundImageView;
@property(nonatomic, retain) UIImageView *infoImageView;
@property(nonatomic, retain) UILabel *ruleLabel;
@property(nonatomic, retain) UILabel *shakeLabel;
@end
