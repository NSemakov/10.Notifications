//
//  MyAppDelegate.m
//  10. Notifications
//
//  Created by Admin on 17.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "MyAppDelegate.h"
#import <UIKit/UIKit.h>
@implementation MyAppDelegate
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(didEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        [nc addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    }

    return self;
}
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void) didEnterBackground:(NSNotification*) notification {
    NSLog(@"My class: didEnterBackground");
}
-(void) applicationDidBecomeActive: (NSNotification*) notification {
    NSLog(@"My class: applicationDidBecomeActive");
}
@end
