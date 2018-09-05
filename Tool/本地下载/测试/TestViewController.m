//
//  TestViewController.m
//  Tool
//
//  Created by 贾仕海 on 2018/6/21.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "TestViewController.h"
#import "TestCollectionViewCell.h"
#import <MJRefresh/MJRefresh.h>
#import "JSHHorseRaceLampView.h"
#import "GuideView.h"

@interface TestViewController () <UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, GuideViewDelegate>
{
    int _count;
    int _index;
    CGFloat beginContentY;          //开始滑动的位置
}

@property (nonatomic, strong) UITableView * coustromTableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) JSHHorseRaceLampView * labelView;
@property (nonatomic, strong) NSArray * arr;
@property (nonatomic, strong) NSTimer* timer;

@property (nonatomic, strong) UIView * headerView;


@end

@implementation TestViewController

#pragma mark - Lifecycle(生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"测试";
    self.view.backgroundColor = [UIColor whiteColor];
    _count = 20;
    
//    [self.view addSubview:self.mainScrollView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.headerView];
    
    GuideView * guideView = [[GuideView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    guideView.delegate = self;
    guideView.imageArr = @[@"01找工作",@"02爱学习",@"03交朋友"];
    [guideView addToWindow];
    
//    self.arr = @[@[@"说的阿萨德",@"3"],@[@"说德11111111231111",@"4"],@[@"说的123阿萨说的123阿萨说的123阿萨",@"3"],@[@"说3的德",@"4"]];
//    [self.view addSubview:self.coustromTableView];
    
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:[self.arr[_index][1] intValue] target:self selector:@selector(showLabel) userInfo:nil repeats:NO];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//    [[NSRunLoop currentRunLoop] run];
//    [self.timer setFireDate:[NSDate distantPast]];
    
//    kWeakSelf(self)
//    // 上拉刷新
//    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        _count += 20;
////        weakself.mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + weakself.collectionView.contentSize.height);
//        [weakself.collectionView reloadData];
//        [weakself.collectionView.mj_footer endRefreshing];
//    }];
}

- (void)endShowGuideView
{
    NSLog(@"结束了");
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    beginContentY = scrollView.contentOffset.y;          //开始滑动的位置
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat endContentY = scrollView.contentOffset.y;
    
    if (endContentY-beginContentY >= 0)
        
    {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.headerView.frame = CGRectMake(0, -50, SCREEN_WIDTH, 50);
            
            self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            
            
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
    }
    
    else
        
    {
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
            
            self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
            
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
    }
}


//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//
//{
//
//    CGFloat endContentY = scrollView.contentOffset.y;
//
//    if (endContentY-beginContentY >= 0)
//
//    {
//
//        [UIView animateWithDuration:0.25 animations:^{
//
//            self.headerView.frame = CGRectMake(0, -50, SCREEN_WIDTH, 50);
//
//            self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//
//
//
//        } completion:^(BOOL finished) {
//
//
//
//        }];
//
//    }
//
//    else
//
//    {
//
//        [UIView animateWithDuration:0.25 animations:^{
//
//            self.headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
//
//            self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
//
//
//        } completion:^(BOOL finished) {
//
//
//
//        }];
//
//    }
//
//
//
//}

- (void)showLabel
{
    CGFloat width = [self widthForString:self.arr[_index][0] fontSize:11 andHeight:30];
    
    if (width > SCREEN_WIDTH - 80)
    {
        self.labelView.frame = CGRectMake(15, 25, SCREEN_WIDTH - 30, 30);
    }
    else
    {
        self.labelView.frame = CGRectMake(15, 25, width + 50, 30);
    }
    [self.labelView setheaderImage:self.arr[_index][0] title:self.arr[_index][0]];
    
    kWeakSelf(self);
    [UIView animateWithDuration:2 animations:^{
        weakself.labelView.alpha = 1;
    } completion:^(BOOL finished)
    {
        [UIView animateWithDuration:2 animations:^{
            weakself.labelView.alpha = 0;
        } completion:^(BOOL finished)
        {
            NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:[self.arr[_index][1] intValue] target:self selector:@selector(showLabel) userInfo:nil repeats:NO];
        }];
    }];
    
    if (_index == self.arr.count - 1)
    {
        _index = 0;
    }
    else
    {
        _index ++;
    }
}


#pragma mark - Custom Accessors (控件响应方法)


#pragma mark - IBActions(xib响应方法)


#pragma mark - Public (.h 公共调用方法)


#pragma mark - Private (.m 私有方法)

-(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
}

#pragma mark - Deletate/DataSource (相关代理)


#pragma mark -- 协议实现

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    lineView.backgroundColor = [UIColor grayColor];
    
//    CGFloat width = [self widthForString:self.arr[_index][0] fontSize:11 andHeight:30];
//
//    if (width > SCREEN_WIDTH - 80)
//    {
//        self.labelView.frame = CGRectMake(15, 25, SCREEN_WIDTH - 30, 30);
//    }
//    else
//    {
//        self.labelView.frame = CGRectMake(15, 25, width + 40, 30);
//    }
//
//    [self.labelView setheaderImage:self.arr[_index][0] title:self.arr[_index][0]];
    self.labelView.alpha = 0;
    [lineView addSubview:self.labelView];
    _index = 0;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:[self.arr[_index][1] intValue] target:self selector:@selector(showLabel) userInfo:nil repeats:NO];
    
    return lineView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 5;
    }
    else
    {
        
        return _count;
    }
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestCollectionViewCellident" forIndexPath:indexPath];
    //
    return cell;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-( void )collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//返回这个UICollectionViewCell是否可以被选择
-( BOOL )collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES ;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath
{

    NSArray * array = @[@(SCREEN_WIDTH / 2 + 100),@(SCREEN_WIDTH / 2),@(SCREEN_WIDTH / 2 - 100)];
    if (indexPath.section == 0)
    {
        return CGSizeMake(SCREEN_WIDTH, 50);
    }
    else
    {
        return CGSizeMake (SCREEN_WIDTH / 2, [array[indexPath.row % 3] floatValue]);
    }
}

//定义每个UICollectionView 的边距
-(UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger )section {
    
    return UIEdgeInsetsMake (0, 0, 0, 0);
}

//这个是两行cell之间的间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//两个cell之间的间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark - Setter/Getter


- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 2;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - JSH_NavbarAndStatusBarHeight) collectionViewLayout:layout];
        [_collectionView registerNib:[UINib nibWithNibName:@"TestCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"TestCollectionViewCellident"];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self ;
        _collectionView.dataSource = self ;
        _collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        
    }
    return _collectionView;
}

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

- (JSHHorseRaceLampView *)labelView
{
    if (!_labelView)
    {
        _labelView = [[JSHHorseRaceLampView alloc] initWithFrame:CGRectMake(15, 25, SCREEN_WIDTH - 30, 30)];
    }
    return _labelView;
}

- (UIView *)headerView
{
    if (!_headerView)
    {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _headerView.backgroundColor = [UIColor grayColor];
    }
    return _headerView;
}

@end
