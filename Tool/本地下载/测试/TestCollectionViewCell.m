//
//  TestCollectionViewCell.m
//  Tool
//
//  Created by 贾仕海 on 2018/6/21.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "TestCollectionViewCell.h"

@interface TestCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation TestCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
//    self.titleLabel.layer.cornerRadius = 4;
//    self.titleLabel.layer.borderWidth = 0.5;
//    self.titleLabel.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)setKeyword:(NSString *)keyword {
    _keyword = keyword;
    _titleLabel.text = _keyword;
    [self layoutIfNeeded];
    [self updateConstraintsIfNeeded];
}

- (CGSize)sizeForCell {
    //宽度加 heightForCell 为了两边圆角。
    return CGSizeMake([_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)].width + 18, 29);
}
@end
