//
//  SDCycleScrollViewVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "SDCycleScrollViewVC.h"
#import "SDCycleScrollView.h"

@interface SDCycleScrollViewVC () <SDCycleScrollViewDelegate>

@end

@implementation SDCycleScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义轮播图";
    
    // 网络加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) delegate:self placeholderImage:Default_General_Image];
//    cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
    [self.view addSubview:cycleScrollView];
    
    // 本地加载图片的轮播器
    SDCycleScrollView *cycleScrollView1 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 200) imageNamesGroup:@[@"01找工作",@"02爱学习",@"03交朋友",@"04乐生活"]];
    [self.view addSubview:cycleScrollView1];
    
    
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    
}

@end
