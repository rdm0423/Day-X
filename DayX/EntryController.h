//
//  EntryController.h
//  DayX
//
//  Created by Ross McIlwaine on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;
- (void)removeEntry:(Entry *)entry;
- (void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry;

@end
