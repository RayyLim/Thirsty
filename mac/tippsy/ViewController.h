//
//  ViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShakeViewController.h"

@interface ViewController : UIViewController {
    ShakeViewController *shakeViewController;
    
}

@property(nonatomic, retain) ShakeViewController *shakeViewController;

- (IBAction) navigateToShakeView:(id) sender;

@end
