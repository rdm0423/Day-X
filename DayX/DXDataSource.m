//
//  DXDataSource.m
//  DayX
//
//  Created by Ross McIlwaine on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DXDataSource.h"
#import "DXDetailViewController.h"
#import "DXListViewController.h"
#import "EntryController.h"
#import "DXListTableViewDataSource.h"

@implementation DXDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger beforeIndex = ((DXDetailViewController *)viewController).index - 1;
    
    return [self viewControllerAtIndex:beforeIndex];
                             
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger afterIndex = ((DXDetailViewController *)viewController).index + 1;
    
    return [self viewControllerAtIndex:afterIndex];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    
    if (index < 0 || index >= [[EntryController sharedInstance].entries count]) {
        return nil;
    }
    
    DXDetailViewController *viewController = [DXDetailViewController new];
    viewController.index = index;
    [viewController updateWithEntry:[EntryController sharedInstance].entries[index]];
    
    return viewController;
}

@end
