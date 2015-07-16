//
//  Government.m
//  10. Notifications
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "Government.h"

NSString* const GovernmentSalaryDidChangeNotification=@"GovernmentSalaryDidChangeNotification";
NSString* const GovernmentPensionDidChangeNotification=@"GovernmentPensionDidChangeNotification";
NSString* const GovernmentTaxLevelDidChangeNotification=@"GovernmentTaxLevelDidChangeNotification";
NSString* const GovernmentAveragePriceDidChangeNotification=@"GovernmentAveragePriceDidChangeNotification";

NSString* const GovernmentSalaryDidChangeUserInfoKey=@"GovernmentSalaryDidChangeUserInfoKey";
NSString* const GovernmentPensionDidChangeUserInfoKey=@"GovernmentPensionDidChangeUserInfoKey";
NSString* const GovernmentTaxLevelDidChangeUserInfoKey=@"GovernmentTaxLevelDidChangeUserInfoKey";
NSString* const GovernmentAveragePriceDidChangeUserInfoKey=@"GovernmentAveragePriceDidChangeUserInfoKey";
@implementation Government

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.salary=1000;
        self.pension=400;
        self.taxLevel=13;
        self.averagePrice=200;
    }
    return self;
}
-(void) setSalary:(CGFloat)salary {
    _salary=salary;
    NSDictionary* dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:salary], GovernmentSalaryDidChangeUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentSalaryDidChangeNotification object:nil userInfo:dict];
    
}

@end
