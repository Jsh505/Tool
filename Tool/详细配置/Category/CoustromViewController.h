//
//  CoustromViewController.h
//  11111
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"

/** 进入刷新状态的回调 */
typedef void (^MJRefreshBlock)(void);

@class MJRefreshHeader, MJRefreshFooter;

@interface CoustromViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UITableView * coustromTableView;

//结束刷新
- (void)endRefreshing;

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;

- (void)CreatRefreshWithHeaderRefreshBlock:(MJRefreshBlock)headerBlock footerRefreshBlock:(MJRefreshBlock)footerBlock;


@end
