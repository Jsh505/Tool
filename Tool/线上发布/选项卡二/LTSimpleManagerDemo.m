//
//  LTSimpleManagerDemo.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/18.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTSimpleManagerDemo.h"
#import "LTSimpleTestOneVC.h"
#import "MJRefresh.h"
#import "LTScrollView-Swift.h"

@interface LTSimpleManagerDemo () <LTSimpleScrollViewDelegate>

@property(copy, nonatomic) NSArray <UIViewController *> *viewControllers;
@property(copy, nonatomic) NSArray <NSString *> *titles;
@property(strong, nonatomic) LTLayout *layout;
@property(strong, nonatomic) LTSimpleManager *managerView;
@end

@implementation LTSimpleManagerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupSubViews];
}


-(void)setupSubViews {
    
    [self.view addSubview:self.managerView];

    __weak typeof(self) weakSelf = self;
    
    //配置headerView
    [self.managerView configHeaderView:^UIView * _Nullable{
        return [weakSelf setupHeaderView];
    }];
    
    //pageView点击事件
    [self.managerView didSelectIndexHandle:^(NSInteger index) {
        NSLog(@"点击了 -> %ld", index);
    }];
    
    //控制器刷新事件
    [self.managerView refreshTableViewHandle:^(UIScrollView * _Nonnull scrollView, NSInteger index) {
        __weak typeof(scrollView) weakScrollView = scrollView;
        scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            __strong typeof(weakScrollView) strongScrollView = weakScrollView;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"对应控制器的刷新自己玩吧，这里就不做处理了🙂-----%ld", index);
                [strongScrollView.mj_header endRefreshing];
            });
        }];
    }];
    
}

-(UILabel *)setupHeaderView {
    UILabel *headerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 185)];
    headerView.backgroundColor = [UIColor redColor];
    headerView.text = @"点击响应事件";
    headerView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [headerView addGestureRecognizer:gesture];
    return headerView;
}

-(void)tapGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"tapGesture");
}

-(void)glt_scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"---> %lf", scrollView.contentOffset.y);
}

-(LTSimpleManager *)managerView {
    if (!_managerView) {
        _managerView = [[LTSimpleManager alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - JSH_NavbarAndStatusBarHeight) viewControllers:self.viewControllers titles:self.titles currentViewController:self layout:self.layout];
        _managerView.delegate = self;
        //设置悬停位置
//        _managerView.hoverY = 64;
    }
    return _managerView;
}


-(LTLayout *)layout {
    if (!_layout) {
        _layout = [[LTLayout alloc] init];
        _layout.titleViewBgColor = [UIColor orangeColor];
        _layout.pageBottomLineColor = [UIColor yellowColor];
        _layout.bottomLineColor = [UIColor redColor];
    }
    return _layout;
}


- (NSArray <NSString *> *)titles {
    if (!_titles) {
        _titles = @[@"热门", @"精彩推荐", @"科技控", @"游戏", @"汽车", @"财经", @"搞笑", @"图片"];
    }
    return _titles;
}


-(NSArray <UIViewController *> *)viewControllers {
    if (!_viewControllers) {
        _viewControllers = [self setupViewControllers];
    }
    return _viewControllers;
}


-(NSArray <UIViewController *> *)setupViewControllers {
    NSMutableArray <UIViewController *> *testVCS = [NSMutableArray arrayWithCapacity:0];
    [self.titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LTSimpleTestOneVC *testVC = [[LTSimpleTestOneVC alloc] init];
        [testVCS addObject:testVC];
    }];
    return testVCS.copy;
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
