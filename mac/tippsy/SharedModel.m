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
    NSString *everybodyMessage1;
    NSString *everybodyMessage2;
    NSString *everybodyMessage3;
    NSString *everybodyMessage4;
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
        
        everybodyMessage1 = [[temp objectForKey:@"rule_everybody"] copy];
        everybodyMessage2 = [[temp objectForKey:@"rule_everybody2"] copy];
        everybodyMessage3 = [[temp objectForKey:@"rule_everybody3"] copy];
        everybodyMessage4 = [NSString stringWithFormat:@"Game Over\nTippsy Yet?"];
        
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
    TippsyRule *tippyrule = [self.colorArray objectAtIndex:position];
    
    if(position == 0)
    {
    
    switch (everybodyCount)
    {
        case 0:
            tippyrule.drinkingRule = everybodyMessage1;
            self.bottomMessage = passAndShakeMessage;
            break;
        case 1:
            tippyrule.drinkingRule = everybodyMessage2;

            self.bottomMessage = passAndShakeMessage;
            break;
        case 2:
            tippyrule.drinkingRule = everybodyMessage3;

            self.bottomMessage = passAndShakeMessage;
            break;
        case 3:
            tippyrule.drinkingRule = [NSString stringWithFormat:@"Game Over\nTippsy Yet?"];

            self.bottomMessage = shakeToStartAgainMessage;
            break;
    }
        
everybodyCount = (everybodyCount + 1) % 4;
}
    else{
        self.bottomMessage = passAndShakeMessage;
    }
//    self.bottomMessage = shakeToStartAgainMessage;
    return tippyrule;
}

@end
