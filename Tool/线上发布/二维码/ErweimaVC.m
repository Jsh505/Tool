//
//  ErweimaVC.m
//  Tool
//
//  Created by 贾仕海 on 2018/4/26.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "ErweimaVC.h"
@import HMQRCodeScanner;

@interface ErweimaVC ()
@property (weak, nonatomic) IBOutlet UILabel *scanResultLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ErweimaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"二维码";
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    //生成二维码
    
    [HMScannerController cardImageWithCardName:cardName avatar:avatar scale:0.2 completion:^(UIImage *image) {
        self.imageView.image = image;
    }];
}

- (IBAction)buttonCilick:(id)sender
{
    NSString *cardName = @"天涯刀哥 - 傅红雪";
    UIImage *avatar = [UIImage imageNamed:@"avatar"];
    
    // 实例化扫描控制器
    HMScannerController *scanner = [HMScannerController scannerWithCardName:cardName avatar:avatar completion:^(NSString *stringValue) {

        self.scanResultLabel.text = stringValue;
    }];

    // 设置导航栏样式
    [scanner setTitleColor:[UIColor whiteColor] tintColor:[UIColor greenColor]];

    // 展现扫描控制器
    [self showDetailViewController:scanner sender:nil];
}

@end
