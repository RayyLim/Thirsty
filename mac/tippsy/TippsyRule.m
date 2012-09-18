//
//  TippsyRule.m
//  tippsy
//
//  Created by Raymond Lim on 9/17/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "TippsyRule.h"

@implementation TippsyRule

@synthesize message,messagebg,color,red, green, blue, rule,description;

- (id)initWithRule:(NSString *)initmessage:(NSString *)initmessagebg:(NSString *)initcolor:(int)initred:(int)initgreen:(int)initblue:(NSString *)initrule:(NSString *)initdescription {
    self = [super init];
    
    if(self)
    {
        self.message = [initmessage copy];
        self.messagebg = [initmessagebg copy];
        self.color = [initcolor copy];
        self.red = initred;
        self.green = initgreen;
        self.blue = initblue;
        self.rule = [initrule copy];
        self.description = [initdescription copy];
    }
    return self;
}

@end
