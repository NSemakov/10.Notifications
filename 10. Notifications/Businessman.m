//
//  Businessman.m
//  10. Notifications
//
//  Created by Admin on 17.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Businessman.h"
#import "Government.h"
@implementation Businessman
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taxLevel=5.f;
    }
    NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(taxLevelNotification:) name:GovernmentTaxLevelDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(averagePriceNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(go2sleep:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [nc addObserver:self selector:@selector(UIApplicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    return self;
}
-(void) taxLevelNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentTaxLevelDidChangeUserInfoKey];
    CGFloat taxLevel=[value floatValue];
    if (self.taxLevel>taxLevel) {
        NSLog(@"businessmen are happy");
    } else {
        NSLog(@"businessmen are angry and close their fabrics");
    }
    self.taxLevel=taxLevel;
}
-(void) averagePriceNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentAveragePriceDidChangeNotification];
    CGFloat averagePrice=[value floatValue];
    if (self.averagePrice>averagePrice) {
        NSLog(@"businessmen are nervous about average price");
    } else {
        NSLog(@"businessmen are happy about average price");
    }
    self.averagePrice=averagePrice;
}
-(void) go2sleep:(NSNotification*) notification{
    NSLog(@"Businessmen go to sleep");
}
-(void) UIApplicationDidBecomeActive: (NSNotification*) notification {
    NSLog(@"Businessmen are at work again!");
}
-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
