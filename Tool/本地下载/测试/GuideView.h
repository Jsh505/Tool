//
//  GuideView.h
//  Tool
//
//  Created by 贾仕海 on 2018/7/25.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GuideViewDelegate <NSObject>

- (void)endShowGuideView;

@end

@interface GuideView : UIView

@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (nonatomic, strong) NSArray * imageArr;

@property (nonatomic, weak) id <GuideViewDelegate> delegate;

@end
