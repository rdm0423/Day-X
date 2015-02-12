//
//  DXListTableViewDataSource.m
//  DayX
//
//  Created by Joshua Howland on 9/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXListTableViewDataSource.h"
#import "EntryController.h"

@implementation DXListTableViewDataSource

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *fullEntry = [EntryController sharedInstance].entries;
    return fullEntry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    Entry *fullEntry = [[EntryController sharedInstance].entries objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.textLabel.text = fullEntry.title;
    return cell;
}

@end
