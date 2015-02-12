//
//  EntryController.h
//  DayX
//
//  Created by Ross McIlwaine on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntryController : NSArray

@property (nonatomic, readonly) NSArray *entries;

+ (EntryController *)sharedInstance;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

- (void)replaceEntry:(NSDictionary *)oldEntry withEntry:(NSDictionary *)newEntry;

@end
