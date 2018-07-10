//
//  JSHHorseRaceLampView.h
//  Tool
//
//  Created by 贾仕海 on 2018/7/4.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHHorseRaceLampView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLB;

- (void)setheaderImage:(NSString *)img title:(NSString *)title;

@end
