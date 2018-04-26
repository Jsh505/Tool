//
//  ZLNaviContrViewController.m
//  customNavigatViewController
//
//  Created by 朱占龙 on 16/8/2.
//  Copyright © 2016年 成都信息工程大学. All rights reserved.
//

#import "ZLNaviContrViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface ZLNaviContrViewController ()

@end

@implementation ZLNaviContrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor mainColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIColor* tintColor = [UIColor whiteColor];
    UIColor* barTintColor = [UIColor blueColor];
    self.navigationBar.tintColor = tintColor;
    self.navigationBar.barTintColor = barTintColor;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:tintColor}];
}

/**
 *  重写push方法，在push的同时设置导航栏左右边按钮
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
       
        //当push的时候隐藏下边tabBar控制器
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置导航栏左边按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"返回" highImage:@"返回"];
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}


/**
 *  为了保证只设置一次导航栏的外观，在initialize中设置
 */
+ (void)initialize{
    
    //取得所有的item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //普通状态下的显示
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //若有需要，在此设置禁止状态下的显示
}
@end
