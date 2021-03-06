//
//  Doctor.m
//  10. Notifications
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Doctor.h"
#import "Government.h"
@implementation Doctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.salary=400.f;
        
    }
    
    NSNotificationCenter* nc=[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(salaryNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(averagePriceNotification:) name:GovernmentAveragePriceDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(go2sleep:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [nc addObserver:self selector:@selector(UIApplicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    return self;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //NSLog(@"dealloc doctor");
}

-(void) salaryNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentSalaryDidChangeUserInfoKey];
    CGFloat salary=[value floatValue];
    if (self.salary>salary) {
        NSLog(@"doctors are nervous about salary");
    } else {
        NSLog(@"doctors are happy about salary");
    }
    self.salary=salary;
}
-(void) averagePriceNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentAveragePriceDidChangeNotification];
    CGFloat averagePrice=[value floatValue];
    if (self.averagePrice>averagePrice) {
        NSLog(@"doctors are nervous about average price");
    } else {
        NSLog(@"doctors are happy about average price");
    }
    self.averagePrice=averagePrice;
}
-(void) go2sleep:(NSNotification*) notification{
    NSLog(@"doctors go to sleep");
}
-(void) UIApplicationDidBecomeActive: (NSNotification*) notification {
    NSLog(@"doctors are at work again!");
}
@end
