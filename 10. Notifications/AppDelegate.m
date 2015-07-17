//
//  AppDelegate.m
//  10. Notifications
//
//  Created by Admin on 16.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Government.h"
#import "Doctor.h"
#import "Pensioner.h"
#import "Businessman.h"
@interface AppDelegate ()
@property (strong,nonatomic) Doctor* doctorProperty;
@property (strong,nonatomic) Pensioner* pensProperty;
@property (strong,nonatomic) Businessman* businProperty;
@property (strong,nonatomic) Government* government;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Uchenik
    
    self.government=[[Government alloc]init];
    
    self.doctorProperty=[[Doctor alloc]init];
    self.pensProperty=[[Pensioner alloc]init];
    self.businProperty=[[Businessman alloc]init];
    self.doctorProperty.averagePrice=self.pensProperty.averagePrice=self.businProperty.averagePrice=300.f;
    
    NSNotificationCenter *nc=[NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(governmentNotification:) name:GovernmentSalaryDidChangeNotification object:nil];
    [nc addObserver:self selector:@selector(UIAppNotificationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    self.government.salary=1040.f;
    self.government.pension=10000.f;
    self.government.taxLevel=40.f;
    self.government.averagePrice=1000.f;
    
    //----------
    //end of Uchenik
    
    //Umnichka
    //----------
    //end of Umnichka
    
    //Master
    //code added to proper classes
    
    //----------
    //end of Master
    
    return YES;
}
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
   // NSLog(@"dealloc appdelegate");
}
-(void) governmentNotification:(NSNotification*) notification{
    NSLog(@"gov notification user info:%@",notification.userInfo);
    //to get number, should call object for key in addition.
}
-(void) UIAppNotificationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"did enter 2 sleep");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
