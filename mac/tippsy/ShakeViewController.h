//
//  ShakeViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShakeViewController : UIViewController {
    UIImage* photo;
    UIImage* backgroundPhoto;
    UIImageView *imageView;
    UIImageView *backgroundImageView;
}

@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, retain) UIImageView *backgroundImageView;
@property(nonatomic, retain) UIImage *photo;
@property(nonatomic, retain) UIImage *backgroundPhoto;

@end


