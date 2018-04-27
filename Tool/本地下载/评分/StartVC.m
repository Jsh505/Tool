//
//  StartVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/27.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "StartVC.h"
#import <JhtRatingBar/JhtRatingBar.h>

@interface StartVC ()

/** 评分条 */
@property (nonatomic, strong) JhtRatingBar *ratingBar;

@end

@implementation StartVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"评分";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建UI
    [self createUI];
}



#pragma mark - UI
/** 创建UI */
- (void)createUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBar.translucent = NO;
    
    // 添加评分条
    [self addRatingBar];
}


#pragma mark RatingBar
/** 添加评分条 */
- (void)addRatingBar {
    __weak JhtRatingBar *weakBar = self.ratingBar;
    self.ratingBar.starChange = ^() {
        NSLog(@"scale = %lf", weakBar.scale);
    };
    
    [self.view addSubview:self.ratingBar];
}



#pragma mark - Get
/** 评分条 */
- (JhtRatingBar *)ratingBar {
    if (!_ratingBar) {
        _ratingBar = [[JhtRatingBar alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 280) / 2, 88, 280, 35)];
        
        _ratingBar.bgViewColor = [UIColor lightGrayColor];
        _ratingBar.starTotalNumber = 8;
        _ratingBar.selectedStarNumber = 4;
        _ratingBar.minSelectedNumber = 0;
        _ratingBar.isNeedHalf = YES;
    }
    
    return _ratingBar;
}

@end
