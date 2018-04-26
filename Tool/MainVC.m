//
//  MainVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "MainVC.h"
#import <PYSearch/PYSearch.h>
#import "ZLNaviContrViewController.h"
#import "SDCycleScrollViewVC.h"
#import "TTTAttributedLabelVC.h"
#import "RxWebViewController.h"
#import "MenuTableViewController.h"

@interface MainVC () <PYSearchViewControllerDelegate>

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.coustromTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - JSH_NavbarAndStatusBarHeight - JSH_TabBarHeight);
    [self.view addSubview:self.coustromTableView];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
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
    cell.textLabel.text = @[@"搜索操作",@"轮播图",@"用户协议",@"浏览器",@"导航栏渐变",@"二维码扫描",@"选项卡",@"评分功能",@"提示红点"][indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
        {
            // 1. 设置搜索热门
            NSArray *hotSeaches = @[@"11",@"22"];
            // 2. 创建搜索窗口
            PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
                //搜索回调
            }];
            // 3. 设置显示样式
            searchViewController.hotSearchStyle = PYHotSearchStyleDefault;
//            [searchViewController setSearchBarBackgroundColor:[UIColor mainColor]];
            searchViewController.searchHistoryStyle = PYSearchHistoryStyleNormalTag;
            // 4. 设置代理
            searchViewController.delegate = self;
            // 5. 模态推送窗口
            ZLNaviContrViewController *nav = [[ZLNaviContrViewController alloc] initWithRootViewController:searchViewController];
            [self presentViewController:nav animated:YES completion:nil];
            break;
        }
        case 1:
        {
            SDCycleScrollViewVC * vc = [[SDCycleScrollViewVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            TTTAttributedLabelVC * vc = [[TTTAttributedLabelVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            NSString* urlStr = @"https://www.baidu.com";
            RxWebViewController * webViewController = [[RxWebViewController alloc]initWithUrl:[NSURL URLWithString:urlStr]];
            [self.navigationController pushViewController:webViewController animated:YES];
            break;
        }
        case 4:
        {
            MenuTableViewController * vc = [[MenuTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5:
        {
            break;
        }
        case 6:
        {
            break;
        }
            
        default:
            break;
    }
}

@end
