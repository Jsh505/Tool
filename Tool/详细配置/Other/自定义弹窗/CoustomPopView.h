//
//  CoustomPopView.h
//  Tool
//
//  Created by 贾仕海 on 2018/9/14.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 显示动画完成后的回调 **/
typedef void(^showCompleteBlock)(void);
/** 隐藏动画完成后的回调 **/
typedef void(^hidenCompleteBlock)(void);

@interface CoustomPopView : UIView

/** 背景阴影 **/
@property (weak, nonatomic) IBOutlet UIView *bgView;
/** 内容视图 **/
@property (weak, nonatomic) IBOutlet UIView *contentView;


/** 显示 **/
- (void)showWithComplete:(showCompleteBlock)show;
/** 隐藏 **/
- (void)hidenWithComplete:(hidenCompleteBlock)hiden;
@end
