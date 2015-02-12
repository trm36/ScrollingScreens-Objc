//
//  ContainerViewController.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PresentationViewController.h"

#import "PageViewControllerDataSource.h"
#import "ContentViewController.h"

@interface PresentationViewController () <UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) PageViewControllerDataSource *dataSource;

@end

@implementation PresentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    
    self.dataSource = [PageViewControllerDataSource new];
    self.pageViewController.dataSource = self.dataSource;
    [self.pageViewController setViewControllers:@[[self.dataSource initialViewController]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    
    // We need to add the pageViewController as a childViewController (so that the lifecycle methods get called together. And then we can add the main view of the pageViewController to this viewController's main view.
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];

    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 40)];
    [self.view addSubview:self.pageControl];
    
    self.pageControl.numberOfPages = self.dataSource.pageCount;
}

#pragma mark - UIPageViewController

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers {

    ContentViewController *viewController = pendingViewControllers[0];
    self.pageControl.currentPage = viewController.index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {

    ContentViewController *viewController = previousViewControllers[0];
    if (!completed) {
        self.pageControl.currentPage = viewController.index;
    }
}

@end
