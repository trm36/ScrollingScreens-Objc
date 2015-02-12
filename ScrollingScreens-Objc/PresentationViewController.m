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
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.dataSource = [PageViewControllerDataSource new];
    self.pageViewController.dataSource = self.dataSource;
    [self.pageViewController setViewControllers:@[[self.dataSource initialViewController]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    // We need to add the pageViewController as a childViewController (so that the lifecycle methods get called together. And then we can add the main view of the pageViewController to this viewController's main view.
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

}

@end
