//
//  AppDelegate.m
//  sykTeam
//
//  Created by 熊维东 on 16/9/12.
//  Copyright © 2016年 熊维东. All rights reserved.
//
#define KScreenWidth   [[UIScreen mainScreen]bounds].size.width
#define KScreenHeight   [[UIScreen mainScreen]bounds].size.height

#import "AppDelegate.h"
#import "RootViewController.h"
#import "UIImageView+WebCache.h"
@interface AppDelegate ()

@property (strong, nonatomic) UIView *adView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    RootViewController *rootvc= [[RootViewController alloc]init];
    
    self.window .rootViewController = rootvc;
    
    [self.window makeKeyAndVisible];
    
    [NSThread sleepForTimeInterval:2.0];//设置启动页面时间
    
   // [self ADviewInit];
    
    return YES;
}
-(void)ADviewInit{
    _adView = [[UIView alloc]init];
    _adView.frame = CGRectMake(0, 0,self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
    [self.window addSubview: _adView];
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
     NSString *str = @"http://img4q.duitang.com/uploads/item/201504/08/20150408H0748_LK534.thumb.700_0.jpeg";
    [imageV sd_setImageWithURL:[NSURL URLWithString: str] placeholderImage:[UIImage imageNamed:@"splash"]];
    [ _adView addSubview:imageV];
    [self.window bringSubviewToFront: _adView];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(removeADView) userInfo:nil repeats:NO];
}
#pragma mark - 移除广告View
-(void)removeADView
{
    [ _adView removeFromSuperview];
    
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
