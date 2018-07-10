//
//  NSString+Tool.h
//  Tool
//
//  Created by mac on 17/3/24.
//  Copyright © 2017年 lykj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)

//去掉Html标签
+ (NSString *)filterHTML:(NSString *)html;

@end
