//
//  MXTableViewController.m
//  MXBarManagerDemo
//
//  Created by apple on 16/5/25.
//  Copyright © 2016年 desn. All rights reserved.
//

#import "GradientTableViewController.h"
#import "MXNavigationBarManager.h"

#define SCREEN_RECT [UIScreen mainScreen].bounds
static NSString *const kMXCellIdentifer = @"kMXCellIdentifer";
static const CGFloat headerImageHeight = 260.0f;

@interface GradientTableViewController ()

@property (nonatomic, strong) UIImageView * headerImageView;

@end

@implementation GradientTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initBarManager];
    
    [self initBaseData];
    
    
}

- (void)initBarManager
{
    [MXNavigationBarManager managerWithController:self];
    [MXNavigationBarManager setBarColor:[UIColor colorWithRed:0.5 green:0.5 blue:1 alpha:1]];
    [MXNavigationBarManager setTintColor:[UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1]];
    [MXNavigationBarManager setStatusBarStyle:UIStatusBarStyleDefault];
    [MXNavigationBarManager setZeroAlphaOffset:-64];
    [MXNavigationBarManager setFullAlphaOffset:200];
    [MXNavigationBarManager setFullAlphaTintColor:[UIColor whiteColor]];
    [MXNavigationBarManager setFullAlphaBarStyle:UIStatusBarStyleLightContent];
}

- (void)initBaseData
{
    self.title = @"长草颜文字";
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:kMXCellIdentifer];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerImageHeight)];
    self.headerImageView.image = [UIImage imageNamed:@"headerImage"];
    
    UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, headerImageHeight)];
    back.backgroundColor = [UIColor redColor];
    [back addSubview:self.headerImageView];
    
    self.tableView.tableHeaderView = back;
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"right_arrow"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void)pushToBackView {
    
}

#pragma mark - scrollView delegate 
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [MXNavigationBarManager changeAlphaWithCurrentOffset:scrollView.contentOffset.y];
    
//    NSLog(@"%f",scrollView.contentOffset.y);
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMXCellIdentifer forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
