//
//  ContentViewController.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:32];
    label.textColor = [UIColor whiteColor];
    label.text = self.name;
    [self.view addSubview:label];

}

@end
