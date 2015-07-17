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
-(void) setPension:(CGFloat)pension {
    _pension=pension;
    NSDictionary* dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:pension], GovernmentPensionDidChangeUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentPensionDidChangeNotification object:nil userInfo:dict];
    
}
-(void) setTaxLevel:(CGFloat)taxLevel {
    _taxLevel=taxLevel;
    NSDictionary* dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:taxLevel], GovernmentTaxLevelDidChangeUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentTaxLevelDidChangeNotification object:nil userInfo:dict];
    
}
-(void) setAveragePrice:(CGFloat)averagePrice {
    _averagePrice=averagePrice;
    NSDictionary* dict=[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:averagePrice], GovernmentAveragePriceDidChangeUserInfoKey, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:GovernmentAveragePriceDidChangeNotification object:nil userInfo:dict];
    
}
@end
