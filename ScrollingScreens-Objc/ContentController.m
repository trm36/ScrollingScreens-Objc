//
//  ContentController.m
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ContentController.h"

@interface ContentController()

@property (nonatomic, strong) NSArray *content;

@end

@implementation ContentController

+ (ContentController *)sharedInstance {
    static ContentController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ContentController alloc] init];

        // We'll just fill the contentController with just months for now.
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        sharedInstance.content = [[dateFormatter monthSymbols] copy];
    });
    return sharedInstance;
}

@end
