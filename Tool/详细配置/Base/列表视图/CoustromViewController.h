//
//  CoustromViewController.h
//  11111
//
//  Created by mac on 16/8/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"
#import "HHRefreshManager.h"

@class MJRefreshHeader, MJRefreshFooter;

@interface CoustromViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UITableView * coustromTableView;
@property (nonatomic, strong) HHRefreshManager * refreshManager;

/** 没有数据展示字段 **/
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;



@end
