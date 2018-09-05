//
//  GuideView.m
//  Tool
//
//  Created by 贾仕海 on 2018/7/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "GuideView.h"

@interface GuideView ()
{
    int _count;
    int _indxe;
}

@end

@implementation GuideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"GuideView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
        _indxe = 0;
    }
    return self;
}

- (void)setImageArr:(NSArray *)imageArr
{
    _imageArr = imageArr;
    _count = (int)imageArr.count;
    [self.imageButton setImage:[UIImage imageNamed:imageArr[_indxe]] forState:UIControlStateNormal];
    [self.imageButton setImage:[UIImage imageNamed:imageArr[_indxe]] forState:(UIControlStateHighlighted)];
}

- (IBAction)netxImageView:(id)sender
{
    self.imageButton.highlighted = NO;
    _indxe ++;
    if (_indxe == _count)
    {
        if ([self.delegate respondsToSelector:@selector(endShowGuideView)])
        {
            [self removeFromSuperview];
            [self.delegate endShowGuideView];
        }
        return;
    }
    [self.imageButton setImage:[UIImage imageNamed:_imageArr[_indxe]] forState:UIControlStateNormal];
    [self.imageButton setImage:[UIImage imageNamed:_imageArr[_indxe]] forState:(UIControlStateHighlighted)];
}
@end
