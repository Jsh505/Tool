//
//  NSString+Tool.h
//  Tool
//
//  Created by mac on 17/3/24.
//  Copyright © 2017年 lykj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tool)

#pragma mark -- 时间

//当前时间
+ (NSString *)nowDate;

//明天
+ (NSString *)nextDate;

//时间格式转换
+ (NSString *)timeExchangeWithType:(NSString *)type timeString:(NSString *)timeString;

//MD5加密
- (NSString *)md5WithString;

#pragma mark -- 正则判断

//手机号码验证
+ (BOOL)isMobile:(NSString *)mobile;

//邮箱
+ (BOOL)isEmail:(NSString *)email;

//验证码
+ (BOOL)isEmployeeNumber:(NSString *)number;

//正则匹配用户密码6-20位数字和字母组合
+ (BOOL)isPassword:(NSString *)password;

//正则匹配用户昵称2-12位
+ (BOOL)isNickName:(NSString *)nickName;

//去掉Html标签
+ (NSString *)filterHTML:(NSString *)html;

@end
