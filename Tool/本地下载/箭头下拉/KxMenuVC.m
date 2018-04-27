//
//  KxMenuVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/27.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "KxMenuVC.h"
#import "KxMenu.h"

@interface KxMenuVC ()

@end

@implementation KxMenuVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"按钮下拉";
}
- (IBAction)burronCilick:(UIButton *)sender
{
    {
        NSArray *menuItems =
        @[
          
          [KxMenuItem menuItem:@"ACTION MENU 1234456"
                         image:nil
                        target:nil
                        action:NULL],
          
          [KxMenuItem menuItem:@"Share this"
                         image:[UIImage imageNamed:@"action_icon"]
                        target:self
                        action:@selector(pushMenuItem:)],
          
          [KxMenuItem menuItem:@"Check this menu"
                         image:nil
                        target:self
                        action:@selector(pushMenuItem:)],
          
          [KxMenuItem menuItem:@"Reload page"
                         image:[UIImage imageNamed:@"reload"]
                        target:self
                        action:@selector(pushMenuItem:)],
          
          [KxMenuItem menuItem:@"Search"
                         image:[UIImage imageNamed:@"search_icon"]
                        target:self
                        action:@selector(pushMenuItem:)],
          
          [KxMenuItem menuItem:@"Go home"
                         image:[UIImage imageNamed:@"home_icon"]
                        target:self
                        action:@selector(pushMenuItem:)],
          ];
        
        KxMenuItem *first = menuItems[0];
        first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
        first.alignment = NSTextAlignmentCenter;
        
        [KxMenu showMenuInView:self.view fromRect:sender.frame menuItems:menuItems];
    }
}

- (void) pushMenuItem:(id)sender
{
    NSLog(@"%@", sender);
}

@end
