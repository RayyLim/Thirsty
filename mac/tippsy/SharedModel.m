//
//  SharedModel.m
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import "SharedModel.h"

@implementation SharedModel {
    NSString *shakeToStartAgainMessage;
    NSString *passAndShakeMessage;
    int everybodyCount;
}

@synthesize colorArray, bottomMessage;

+ (id)sharedModel {
    static SharedModel *sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}

- (id)init {
    if (self = [super init]) {
        shakeToStartAgainMessage = @"Shake to start again";
        passAndShakeMessage = @"Pass and shake";
        self.bottomMessage = passAndShakeMessage;
        everybodyCount = 0;
        
        NSString *errorDesc = nil;
        NSPropertyListFormat format;
        NSString *plistPath;
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                                  NSUserDomainMask, YES) objectAtIndex:0];
        plistPath = [rootPath stringByAppendingPathComponent:@"Data.plist"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
            plistPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        }
        NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
        NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                              propertyListFromData:plistXML
                                              mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                              format:&format
                                              errorDescription:&errorDesc];
        if (!temp) {
            NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
        }
        
        self.colorArray = [NSArray arrayWithObjects:
                      
                      [[TippsyRule alloc] initWithRule:@"message_everybody":@"messagebg_everybody":@"color_yellow":255:242:0:[temp objectForKey:@"rule_everybody"]:@""],
                      [[TippsyRule alloc] initWithRule:@"message_categories":@"messagebg_categories":@"color_yellowgreen":226:245:76:[temp objectForKey:@"rule_categories"]:[temp objectForKey:@"description_categories"]],
                      nil];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (TippsyRule *)getRule:(int) position {
    if(position == 1)
    {
        everybodyCount = (everybodyCount + 1) % 4;
    }
    
    if(everybodyCount == 3)
    {
        buttomMessage = passAndShakeMessage;
    }
    else
    {
        buttomMessage = shakeToStartAgainMessage;
    }
    
    return [self.colorArray objectAtIndex:position];
}

@end
