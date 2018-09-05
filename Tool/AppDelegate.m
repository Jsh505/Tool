//
//  AppDelegate.m
//  Tool
//
//  Created by mac on 17/3/24.
//  Copyright © 2017年 lykj. All rights reserved.
//

#import "AppDelegate.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "ZLTabBarViewController.h"
#import <KSGuaidView/KSGuaidViewManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (instancetype)delegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    [self goHome];
    
//    --------------------------------------------------键盘处理--------------------------------------------------
    [self configureBoardManager];
    
//    --------------------------------------------------引导页--------------------------------------------------
    [self configureKSGuaidManager];
    
    /** 性能检测打开 **/
    [[WHDebugToolManager sharedInstance] toggleWith:DebugToolTypeAll];
    
    
    return YES;
}

#pragma mark - 基础条件配置
-(void)configureBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.keyboardDistanceFromTextField=60;
    manager.enableAutoToolbar = NO;
    
    [[UITextField appearance] setTintColor:[UIColor mainColor]];  //改变光标颜色
}

-(void)configureKSGuaidManager
{
    KSGuaidManager.images = @[[UIImage imageNamed:@"01找工作"],
                              [UIImage imageNamed:@"02爱学习"],
                              [UIImage imageNamed:@"03交朋友"],
                              [UIImage imageNamed:@"04乐生活"]];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    KSGuaidManager.dismissButtonCenter = CGPointMake(size.width / 2, size.height - 80);
    
    KSGuaidManager.dismissButtonImage = [UIImage imageNamed:@"立即体验"];
    
    [KSGuaidManager begin];
}

- (void)goLogin
{
    //登录
    
}

- (void)goHome
{
    //主页
    ZLTabBarViewController *tabBarViewContr = [[ZLTabBarViewController alloc] init];
    self.window.rootViewController = tabBarViewContr;
    [self.window makeKeyAndVisible];
}






@end
