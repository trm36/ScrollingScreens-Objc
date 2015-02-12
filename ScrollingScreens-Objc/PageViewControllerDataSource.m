//
//  PageViewControllerDataSource.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PageViewControllerDataSource.h"

#import "ContentController.h"
#import "ContentViewController.h"

@implementation PageViewControllerDataSource

- (UIViewController *)initialViewController {

    ContentViewController *viewController = [ContentViewController new];
    viewController.index = 0;
    viewController.name = [[ContentController sharedInstance].content[0] description];
    
    return viewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    NSInteger beforeIndex = ((ContentViewController *)viewController).index - 1;
    return [self viewControllerAtIndex:beforeIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {

    NSInteger afterIndex = ((ContentViewController *)viewController).index + 1;
    return [self viewControllerAtIndex:afterIndex];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    
    // Returning nil is how the pageViewController knows it has reached the end of the paging. We need to see if the current index is 0 or if the index is beyond the content.
    
    if (index < 0 || index >= [ContentController sharedInstance].content.count) {
        return nil;
    }
    
    ContentViewController *viewController = [ContentViewController new];
    viewController.index = index;
    viewController.name = [ContentController sharedInstance].content[index];

    return viewController;
}

@end
