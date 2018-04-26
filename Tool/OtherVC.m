//
//  OtherVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "OtherVC.h"

@interface OtherVC ()

@end

@implementation OtherVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField * textfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, 300, 60)];
    [self.view addSubview:textfield];
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
