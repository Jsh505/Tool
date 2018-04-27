//
//  CountDownButtonVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/27.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "CountDownButtonVC.h"

@interface CountDownButtonVC ()

@property (weak, nonatomic) IBOutlet UIButton *codeButton;

@end

@implementation CountDownButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"倒计时";
    
    [self.codeButton countDownWithTimeInterval:3];
}




@end
