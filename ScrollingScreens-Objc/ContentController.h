//
//  ContentController.h
//  ScrollingScreens-Objc
//
//  Created by Joshua Howland on 2/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentController : NSObject

+ (ContentController *)sharedInstance;

@property (nonatomic, strong, readonly) NSArray *content;

@end
