//
//  CoustromViewController.m
//  11111
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CoustromViewController.h"
#import "MJRefresh.h"

@interface CoustromViewController ()


@end

@implementation CoustromViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.coustromTableView.emptyDataSetSource = self;
    self.coustromTableView.emptyDataSetDelegate = self;
}

#pragma mark -- UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //cell个数
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell样式
    static NSString * CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell点击
}

#pragma mark - DZNEmptyDataSetSource Methods

//图片
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    return nil;
}

//属性字符串
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"暂无数据";
    return [[NSAttributedString alloc] initWithString:text attributes:nil];
}

//背景色
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return [UIColor clearColor];
}

//此外，你还可以调整内容视图的垂直对齐（即：有用的时候，有tableheaderview可见）：
- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -40.0;
}

//最后，您可以将组件彼此分离（默认分离为11个点）：
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView
{
    return 20.0f;
}

#pragma mark 刷新

- (void)CreatRefreshWithHeaderRefreshBlock:(MJRefreshBlock)headerBlock footerRefreshBlock:(MJRefreshBlock)footerBlock
{
    self.coustromTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^ {
        headerBlock();
    }];
    
    // 上拉刷新
    self.coustromTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        footerBlock();
    }];
}

- (void)endRefreshing {
    [self.coustromTableView.mj_header endRefreshing];
    [self.coustromTableView.mj_footer endRefreshing];
}

#pragma mark -- getter

- (UITableView *)coustromTableView
{
    if (!_coustromTableView) {
        _coustromTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _coustromTableView.delegate = self;
        _coustromTableView.dataSource = self;
        _coustromTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _coustromTableView.showsVerticalScrollIndicator = NO;
        _coustromTableView.showsHorizontalScrollIndicator = NO;
    }
    return _coustromTableView;
}

@end
