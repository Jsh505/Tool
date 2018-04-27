//
//  GBTagListViewVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/27.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "GBTagListViewVC.h"
#import "GBTagListView.h"

@interface GBTagListViewVC ()


@property (nonatomic, strong) NSArray * strArray;
@property (nonatomic, strong) GBTagListView * tempTag;

@end

@implementation GBTagListViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"自定义标签";
    
    self.strArray = @[@"大好人",@"自定义流式标签",@"github",@"code4app",@"已婚",@"阳光开朗",@"慷慨大方帅气身材好",@"仗义",@"值得一交的朋友",@"值得一交的朋友",@"值得的交",@"值得一交的朋友",@"值得一交的朋友",@"大好人",@"自定义流式标签",@"github",@"code4app",@"已婚"];
    
    GBTagListView *tagList = [[GBTagListView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 0)];
    /**允许点击 */
    tagList.canTouch = YES;
    /**可以控制允许点击的标签数 */
    tagList.canTouchNum = 5;
    /**控制是否是单选模式 */
    tagList.isSingleSelect = NO;
    tagList.signalTagColor = [UIColor whiteColor];
    [tagList setTagWithTagArray:self.strArray];
    __weak __typeof(self)weakSelf = self;
    
    [tagList setDidselectItemBlock:^(NSArray *arr)
     {
        NSLog(@"选中的标签%@",arr);
        [weakSelf.tempTag removeFromSuperview];
        GBTagListView*selectItems= [[GBTagListView alloc]initWithFrame:CGRectMake(0,tagList.frame.origin.y+tagList.frame.size.height+40 , SCREEN_WIDTH, 0)];
        selectItems.signalTagColor = [UIColor whiteColor];
        selectItems.canTouch = NO;
        [selectItems setMarginBetweenTagLabel:20 AndBottomMargin:20];
        [selectItems setTagWithTagArray:arr];
        [weakSelf.view addSubview:selectItems];
        weakSelf.tempTag = selectItems;
        
        
    }];
    
    [self.view addSubview:tagList];
    UILabel*tip=[[UILabel alloc]initWithFrame:CGRectMake(0, tagList.frame.origin.y+tagList.frame.size.height+10, SCREEN_WIDTH, 20)];
    tip.text=@"选中的标签是：";
    tip.textAlignment=NSTextAlignmentCenter;
    tip.font=[UIFont boldSystemFontOfSize:18];
    [self.view addSubview:tip];
    
    
}



@end
