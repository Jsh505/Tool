//
//  NSLayoutConstraint+IBDesignable.m
//  Tool
//
//  Created by 贾仕海 on 2018/9/12.
//  Copyright © 2018年 lykj. All rights reserved.
//

#import "NSLayoutConstraint+IBDesignable.h"

@implementation NSLayoutConstraint (IBDesignable)

-(void)setWidthScreen:(BOOL)widthScreen{
    if (widthScreen) {
        self.constant = JSH_WIDTH(self.constant);
    }else{
        self.constant = self.constant;
    }
}

-(BOOL)widthScreen{
    return self.widthScreen;
}



@end
