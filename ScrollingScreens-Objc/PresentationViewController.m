//
//  ContainerViewController.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PresentationViewController.h"

#import "PageViewControllerDataSource.h"

@interface PresentationViewController () <UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) PageViewControllerDataSource *dataSource;

@end

@implementation PresentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.dataSource = [PageViewControllerDataSource new];
    self.pageViewController.dataSource = self.dataSource;
    [self.pageViewController setViewControllers:@[[self.dataSource viewControllerAtIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    // We need to add the pageViewController as a childViewController (so that the lifecycle methods get called together (ex. viewDidLoad, viewDidUnload, dealloc). Then we can add the main view of the pageViewController to this viewController's main view. This is not the only way to do this, but it is the way that Apple does it, and the way you are learning it today.
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

@end
