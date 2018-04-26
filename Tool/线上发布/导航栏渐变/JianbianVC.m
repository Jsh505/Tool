//
//  JianbianVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/26.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "JianbianVC.h"
#import "MXNavigationBarManager.h"

static const CGFloat headerImageHeight = 260.0f;

@interface JianbianVC ()

@property (nonatomic, strong) UIImageView * headerImageView;

@end

@implementation JianbianVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBarManager];
    
    [self initBaseData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.coustromTableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.coustromTableView.delegate = nil;
    [MXNavigationBarManager reStoreToSystemNavigationBar];
    
    //还原导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor mainColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIColor* tintColor = [UIColor whiteColor];
    UIColor* barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.tintColor = tintColor;
    self.navigationController.navigationBar.barTintColor = barTintColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:tintColor}];
}

- (void)initBarManager
{
    [MXNavigationBarManager managerWithController:self];
    [MXNavigationBarManager setBarColor:[UIColor mainColor]];
    [MXNavigationBarManager setTintColor:[UIColor blackColor]];
    [MXNavigationBarManager setStatusBarStyle:UIStatusBarStyleDefault];
    [MXNavigationBarManager setZeroAlphaOffset:0];
    [MXNavigationBarManager setFullAlphaOffset:200];
    [MXNavigationBarManager setFullAlphaTintColor:[UIColor whiteColor]];
    [MXNavigationBarManager setFullAlphaBarStyle:UIStatusBarStyleLightContent];
}

- (void)initBaseData
{
    self.title = @"长草颜文字";
    self.coustromTableView.contentInset = UIEdgeInsetsMake(-JSH_NavbarAndStatusBarHeight, 0, 0, 0);
    self.coustromTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.coustromTableView];
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerImageHeight)];
    self.headerImageView.image = [UIImage imageNamed:@"headerImage"];
    
    UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerImageHeight)];
    back.backgroundColor = [UIColor redColor];
    [back addSubview:self.headerImageView];
    
    self.coustromTableView.tableHeaderView = back;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right_arrow"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)pushToBackView {
    
}

#pragma mark - scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [MXNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
    
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat width = self.view.frame.size.width;
    // 图片宽度
    CGFloat yOffset = scrollView.contentOffset.y;
    // 偏移的y值
    if(yOffset < 0)
    {CGFloat totalOffset = headerImageHeight + ABS(yOffset);
        CGFloat f = totalOffset / headerImageHeight;
        //拉伸后的图片的frame应该是同比例缩放。
        self.headerImageView.frame =  CGRectMake(- (width *f-width) / 2, yOffset, width * f, totalOffset);
        NSLog(@"we=%f,he=%f",width * f,totalOffset)
    }
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
