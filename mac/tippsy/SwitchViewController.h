//
//  SwitchViewController.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RollingViewController.h";
#import "ResultViewController.h";

@interface SwitchViewController : UIViewController {
    IBOutlet RollingViewController *rollingViewController;
    IBOutlet ResultViewController *resultViewController;
}
- (IBAction)switchViews:(id)sender;
@property (nonatomic, retain) RollingViewController *rollingViewController;
@property (nonatomic, retain) ResultViewController *resultViewController;
@end
