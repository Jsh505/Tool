//
//  RedBadgeVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/27.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "RedBadgeVC.h"
#import "WZLBadgeImport.h"

@interface RedBadgeVC ()
@property (weak, nonatomic) IBOutlet UILabel *labeleLB;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation RedBadgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"小红点";
    
    [self.labeleLB showBadgeWithStyle:WBadgeStyleRedDot value:1 animationType:WBadgeAnimTypeNone];
    
    [self.imageView showBadgeWithStyle:WBadgeStyleNumber value:10 animationType:WBadgeAnimTypeScale];
    
    [self.button showBadgeWithStyle:WBadgeStyleNew value:99 animationType:WBadgeAnimTypeShake];
}



@end
