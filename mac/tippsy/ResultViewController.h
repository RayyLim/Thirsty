//
//  ResultViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "RollingViewController.h"

@interface ResultViewController : UIViewController{
//    RollingViewController *rollingViewController;
}

//@property(nonatomic, retain) RollingViewController *rollingViewController;

- (IBAction) navigateToRollingViewContainer:(id) sender;
- (IBAction) showInfoDialog:(id) sender;
- (IBAction) hideInfoDialog:(id) sender;
@end
