//
//  ViewController.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "PresentationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)presentScreens:(id)sender {

    PresentationViewController *pageViewController = [PresentationViewController new];
    [self presentViewController:pageViewController animated:YES completion:nil];
}

@end
