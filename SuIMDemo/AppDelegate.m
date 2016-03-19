//
//  AppDelegate.m
//  SuIMDemo
//
//  Created by AbelSu on 16/3/19.
//  Copyright © 2016年 AbelSu. All rights reserved.
//

#import "AppDelegate.h"
#import "NIMSDK.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[NIMSDK sharedSDK] registerWithAppID:@"55e11174335e8178c3e707677b053d0f" cerName:@"debug"];
    return YES;
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[NIMSDK sharedSDK] updateApnsToken:deviceToken];
}

@end
