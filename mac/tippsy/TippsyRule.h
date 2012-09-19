//
//  TippsyRule.h
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TippsyRule : NSObject{
    NSString *message;
    NSString *messagebg;
    NSString *rule;
    NSString *description;
    NSString *color;
    int red;
    int green;
    int blue;
}

@property(nonatomic, retain) NSString *message;
@property(nonatomic, retain) NSString *messagebg;
@property(nonatomic, retain) NSString *rule;
@property(nonatomic, retain) NSString *description;
@property(nonatomic, retain) NSString *color;
@property int red;
@property int green;
@property int blue;

- (id)initWithRule:(NSString *)initmessage:(NSString *)initmessagebg:(NSString *)initcolor:(int)initred:(int)initgreen:(int)initblue:(NSString *)initrule:(NSString *)initdescription;

@end
