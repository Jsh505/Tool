//
//  CoustomPopView.m
//  Tool
//
//  Created by 贾仕海 on 2018/9/14.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "CoustomPopView.h"

/** 动画显示时间 **/
static CGFloat const CoustomPopViewShowTime = 0.35;
/** 动画隐藏时间 **/
static CGFloat const CoustomPopViewHidenTime = 0.15;
/** 背景阴影透明度 **/
static CGFloat const CoustomPopViewAlpha = 0.5;

@implementation CoustomPopView

#pragma mark - Lifecycle(生命周期)

/** 初始化方法 **/
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"CoustomPopView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

/** 默认绘制方法 **/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UITapGestureRecognizer * singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgViewTapCilick)];
    singleRecognizer.numberOfTapsRequired = 1;
    [self.bgView addGestureRecognizer:singleRecognizer];
}

#pragma mark - Get Data (获取数据)


#pragma mark - Custom Accessors (控件响应方法)

/** 背景视图点击 **/
- (void)bgViewTapCilick
{
    [self hidenWithComplete:^{
    }];
}

#pragma mark - IBActions(xib响应方法)


#pragma mark - Public (.h 公共调用方法)


- (void)showWithComplete:(showCompleteBlock)show
{
    [self addToWindow];
    self.bgView.alpha = 0;
    self.contentView.layer.transform = CATransform3DMakeScale(0.001, 0.001, 0.001);
    [UIView animateWithDuration:CoustomPopViewShowTime animations:^{
        self.contentView.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.bgView.alpha = CoustomPopViewAlpha;
    } completion:^(BOOL finished) {
        show();
    }];
}

- (void)hidenWithComplete:(hidenCompleteBlock)hiden
{
    [UIView animateWithDuration:CoustomPopViewHidenTime animations:^{
        self.contentView.layer.transform = CATransform3DMakeScale(0.001, 0.001, 0.001);
        self.bgView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        hiden();
    }];
}

#pragma mark - Private (.m 私有方法)


#pragma mark - Deletate/DataSource (相关代理)


#pragma mark - Setter/Getter

@end
