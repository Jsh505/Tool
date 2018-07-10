//
//  JSHHorseRaceLampView.m
//  Tool
//
//  Created by 贾仕海 on 2018/7/4.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "JSHHorseRaceLampView.h"

@implementation JSHHorseRaceLampView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"JSHHorseRaceLampView" owner:self options:nil].lastObject;
    }
    return self;
}

- (void)setheaderImage:(NSString *)img title:(NSString *)title
{
    [self.headerImageView jsh_sdsetImageWithHeaderimg:img];
    self.titleLB.text = title;
}

@end
