//
//  CoustomePopVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/9/14.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "CoustomePopVC.h"
#import "CoustomPopView.h"

@interface CoustomePopVC ()

@property (nonatomic, strong) CoustomPopView * popView;
@property (nonatomic, strong) CoustomPopView * otherPopView;

@end

@implementation CoustomePopVC

#pragma mark - Lifecycle(生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"自定义弹窗";
}

#pragma mark - Get Data (获取数据)


#pragma mark - Custom Accessors (控件响应方法)


#pragma mark - IBActions(xib响应方法)

- (IBAction)buttonCilick:(id)sender
{
    [self.popView showWithComplete:^() {
        [self.otherPopView showWithComplete:^{
        }];
    }];
}


#pragma mark - Public (.h 公共调用方法)


#pragma mark - Private (.m 私有方法)


#pragma mark - Deletate/DataSource (相关代理)


#pragma mark - Setter/Getter

- (CoustomPopView *)popView
{
    if (!_popView)
    {
        _popView = [[CoustomPopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _popView;
}

- (CoustomPopView *)otherPopView
{
    if (!_otherPopView)
    {
        _otherPopView = [[CoustomPopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _otherPopView;
}
@end
