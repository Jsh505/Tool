//
//  OtherVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "OtherVC.h"
#import "StartVC.h"
#import "CountDownButtonVC.h"
#import "GBTagListViewVC.h"
#import "KxMenuVC.h"
#import "ZZBrowserVC.h"
#import "TestViewController.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.coustromTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - JSH_NavbarAndStatusBarHeight - JSH_TabBarHeight);
    [self.view addSubview:self.coustromTableView];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = @[@"评分功能",@"倒计时",@"自定义标签",@"按钮下拉菜单",@"多选图片",@"测试"][indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            StartVC * vc = [[StartVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            CountDownButtonVC * vc = [[CountDownButtonVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            GBTagListViewVC * vc = [[GBTagListViewVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            KxMenuVC * vc = [[KxMenuVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4:
        {
            ZZBrowserVC * vc = [[ZZBrowserVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:
        {
            TestViewController * vc = [[TestViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
