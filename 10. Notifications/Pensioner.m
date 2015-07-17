//
//  Pensioner.m
//  10. Notifications
//
//  Created by Admin on 17.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Pensioner.h"
#import "Government.h"
@implementation Pensioner
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pension=400.f;
    }
    NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(pensionNotification:) name:GovernmentPensionDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(averagePriceNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(go2sleep:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [nc addObserver:self selector:@selector(UIApplicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    return self;
}

-(void) pensionNotification:(NSNotification*) notification{
    NSNumber * value=[notification.userInfo objectForKey:GovernmentPensionDidChangeUserInfoKey];
    CGFloat pension=[value floatValue];
    if (self.pension>pension) {
        NSLog(@"pensioners are hungry");
    } else {
        NSLog(@"pensioners are happy");         
    }
    self.pension=pension;
}
-(void) averagePriceNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentAveragePriceDidChangeNotification];
    CGFloat averagePrice=[value floatValue];
    if (self.averagePrice>averagePrice) {
        NSLog(@"Pensioners are nervous about average price");
    } else {
        NSLog(@"Pensioners are happy about average price");
    }
    self.averagePrice=averagePrice;
}
-(void) go2sleep:(NSNotification*) notification{
    NSLog(@"Pensioners go to sleep");
}
-(void) UIApplicationDidBecomeActive: (NSNotification*) notification {
    NSLog(@"Pensioners are making crowd at hospital again!");
}
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
