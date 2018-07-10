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
    NSString *cardName = @"许可证编号:JY24406223547420\n经营者名称:中亿丰建设集团股份有限公司工地食堂\n社会信用代码(证件号码):91320500137690962B\n法定代表人(负责人):邹建刚主体业态:餐饮服务经营者\n经营场所:成都市龙泉驿区大面街道金枫路与金茶路交界处\n仓库地址:null\n有效期至2023年03月06日\n网址:http://18.26.25.129:8098/fdPb/pu/n!view.do?xkzbh=JY24406223547420";
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
