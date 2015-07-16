//
//  Government.h
//  10. Notifications
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
extern NSString* const GovernmentSalaryDidChangeNotification;
extern NSString* const GovernmentPensionDidChangeNotification;
extern NSString* const GovernmentTaxLevelDidChangeNotification;
extern NSString* const GovernmentAveragePriceDidChangeNotification;

extern NSString* const GovernmentSalaryDidChangeUserInfoKey;
extern NSString* const GovernmentPensionDidChangeUserInfoKey;
extern NSString* const GovernmentTaxLevelDidChangeUserInfoKey;
extern NSString* const GovernmentAveragePriceDidChangeUserInfoKey;

@interface Government : NSObject

@property (assign,nonatomic) CGFloat salary;
@property (assign,nonatomic) CGFloat pension;
@property (assign,nonatomic) CGFloat taxLevel;
@property (assign,nonatomic) CGFloat averagePrice;

-(void) setSalary:(CGFloat)salary;
@end
