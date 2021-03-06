//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)TransToJSONString;

/**
 *  json的字符串转成字典
 *
 *  @return dic 字典
 **/
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//url 参数转换字典
+ (NSMutableDictionary *)getURLParameters:(NSString *)urlStr;
@end


