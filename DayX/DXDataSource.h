//
//  DXDataSource.h
//  DayX
//
//  Created by Ross McIlwaine on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DXDataSource : NSObject <UIPageViewControllerDataSource>

- (UIViewController *)viewControllerAtIndex:(NSInteger)index;

@end
