//
//  SharedModel.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RobotUIKit/RobotUIKit.h>
#import "TippsyRule.h"

@interface SharedModel : NSObject {
     NSArray *colorArray;
    NSString *bottomMessage;
    BOOL ledON;
    BOOL robotOnline;
//    NSString *shakeHandler;
    SEL shakeHandler;
}

@property (nonatomic, retain) NSArray *colorArray;
@property (nonatomic, retain) NSString *bottomMessage;
//@property (nonatomic, retain) NSString *shakeHandler;
@property SEL shakeHandler;

+ (id)sharedModel;
- (TippsyRule *) getRule:(int)position;
- (void) registerForAppLifecycleNotifications;
- (void)setLED:(int) red:(int) green: (int)blue;
@end
