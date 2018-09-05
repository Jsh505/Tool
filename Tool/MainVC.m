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
#import "MenuTableViewController.h"
#import "ErweimaVC.h"
#import "SegmentedControlVC.h"
#import "RedBadgeVC.h"
#import <AXWebViewController/AXWebViewController.h>
#import "LTSimpleManagerDemo.h"

@interface MainVC () <PYSearchViewControllerDelegate, HHRefreshManagerDelegate>

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.coustromTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - JSH_NavbarAndStatusBarHeight - JSH_TabBarHeight);
    [self.view addSubview:self.coustromTableView];
    
    self.refreshManager = [HHRefreshManager refreshWithDelegate:self scrollView:self.coustromTableView type:AnimationTypeCircle];
    
    
    
}

#pragma mark UITableViewDataSource

- (void)beginRefreshWithType:(HHRefreshType)type
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        
        
    });
    [NetManeger GET:@"12312" parameters:nil hudString:@"123123" success:^(id responseObject)
     {
         
         [self.refreshManager endRefreshWithType:HHRefreshTypeHeader];
         [self.refreshManager endRefreshWithType:HHRefreshTypeFooter];
     } failure:^(NSString *error)
     {
         [MBProgressHUD showErrorMessage:error];
         [self.refreshManager endRefreshWithType:HHRefreshTypeHeader];
         [self.refreshManager endRefreshWithType:HHRefreshTypeFooter];
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.coustromTableView.rowHeight = UITableViewAutomaticDimension;
    self.coustromTableView.estimatedRowHeight = 50;
    return self.coustromTableView.rowHeight;
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
    cell.textLabel.text = @[@"搜索操作",@"轮播图",@"用户协议",@"浏览器",@"导航栏渐变",@"二维码扫描",@"选项卡",@"提示红点",@"选项卡二"][indexPath.row];
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
            AXWebViewController *webVC = [[AXWebViewController alloc] initWithAddress:urlStr];
            webVC.showsToolBar = NO;
            [self.navigationController pushViewController:webVC animated:YES];
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
            ErweimaVC * vc = [[ErweimaVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6:
        {
            SegmentedControlVC * vc = [[SegmentedControlVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 7:
        {
            RedBadgeVC * vc = [[RedBadgeVC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 8:
        {
            LTSimpleManagerDemo * vc = [[LTSimpleManagerDemo alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
