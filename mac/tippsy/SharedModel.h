//
//  SharedModel.h
//  tippsy
//
//  Created by Raymond Lim on 9/18/12.
//  Copyright (c) 2012 Raymond Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TippsyRule.h"

@interface SharedModel : NSObject {
     NSArray *colorArray;
}

@property (nonatomic, retain) NSArray *colorArray;


+ (id)sharedModel;

@end
