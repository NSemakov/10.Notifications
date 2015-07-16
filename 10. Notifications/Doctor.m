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
        self.salary=400;
    }
    
    NSNotificationCenter* nc=[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(salaryNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
    
    return self;
}

-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void) salaryNotification:(NSNotification*) notification {
    NSNumber* value=[notification.userInfo objectForKey:GovernmentSalaryDidChangeUserInfoKey];
    CGFloat salary=[value floatValue];
    if (self.salary>salary) {
        NSLog(@"doctors are nervous");
    } else {
        NSLog(@"doctors are happy");
    }
    self.salary=salary;
}
@end
