//
//  AppDelegate.m
//  3DTouch
//
//  Created by xalo on 16/1/21.
//  Copyright © 2016年 LeiGaoWei. All rights reserved.
//

#import "AppDelegate.h"
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)createItem {
    //  UIApplicationShortcutItem
    //  动态创建UIApplicationShortcutItem
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:@"two" localizedTitle:@"第二个" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeLove] userInfo:nil];
    [UIApplication sharedApplication].shortcutItems = @[item];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self createItem];
    // Override point for customization after application launch.
    //  也需要进行一下判断，在launchOptions中有UIApplicationLaunchOptionsShortcutItemKey这样一个键，通过它，我们可以区别是否是从标签进入的app，如果是则处理结束逻辑后，返回NO，防止处理逻辑被反复回调
    
    UIApplicationShortcutItem *item = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (item) {
        NSLog(@"We've launched from shortcut item: %@", item.localizedTitle);
    } else {
        NSLog(@"We've launched properly.");
    }
    return YES;
}
//  响应标签的行为
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //  当我们通过标签进入app时，就会在appdelegate中调用这样一个回调，我们可以获取shortcutItem的信息进行相关逻辑操作。
    NSLog(@"%@", shortcutItem.type);
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
