//
//  TestCollectionViewCell.h
//  Tool
//
//  Created by 贾仕海 on 2018/6/21.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) NSString *keyword;

- (CGSize)sizeForCell;

@end
