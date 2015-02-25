//
//  EntryControler.m
//  Entries
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

static NSString * const entryListKey = @"entryList";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
        
    });
    return sharedInstance;
}

- (NSArray *)entries {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    
    NSArray *objects = [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
    
    return objects;
}


#pragma Mark - addEntry using core data
// New to work with Core Data
- (void)addEntryWithTitle:(NSString *)title text:(NSString *)text andDate:(NSData *)date {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    entry.title = title;
    entry.text = text;
    entry.timestamp = date;
    
    [self synchronize];
}

- (void)removeEntry:(Entry *)entry {
    
    [entry.managedObjectContext deleteObject:entry];
    [self synchronize];
}

- (void)synchronize {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
    
}

@end
