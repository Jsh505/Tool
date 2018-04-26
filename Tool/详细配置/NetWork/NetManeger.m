//
//  NetManeger.m
//  PPNetworkHelper
//
//  Created by 贾仕海 on 2018/4/24.
//  Copyright © 2018年 AndyPang. All rights reserved.
//

#import "NetManeger.h"
#import "AFNetworking.h"

#define NETWORKSUCCESSKEY @"code"  //网络成功关键字
#define NETWORKSUCCESSCODE 0  //网络成功状态码
#define NETWORKDATAKEY @"data"  //网络成功返回字段
#define NETWORKFAILUREDATAKEY @"message"  //网络失败关返回字段


@implementation NetManeger

+ (void)initialize
{
//    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType status)
//     {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//                //未知网络
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//                //无网络
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                //手机自带网络
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                //WIFI
//                break;
//        }
//    }];
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerJSON];
    [PPNetworkHelper setResponseSerializer:PPResponseSerializerJSON];
    [PPNetworkHelper setRequestTimeoutInterval:15];
//    [PPNetworkHelper setValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>]
    [PPNetworkHelper openNetworkActivityIndicator:NO];
    [PPNetworkHelper openLog];
}

/// 取消所有HTTP请求
+ (void)cancelAllRequest
{
    [PPNetworkHelper cancelAllRequest];
}

/// 取消指定URL的HTTP请求
+ (void)cancelRequestWithURL:(NSString *)URL
{
    [PPNetworkHelper cancelRequestWithURL:URL];
}


/**
 *  GET请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                         hudString:(NSString *)hudString
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure
{
    if (![NSObject is_NulllWithObject:hudString])
    {
        [MBProgressHUD showActivityMessageInWindow:hudString];
    }
    
    return [PPNetworkHelper GET:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters success:^(id responseObject)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             success([responseObject objectForKey:NETWORKDATAKEY]);
         }
         else
         {
             failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
         }
    } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
    }];
}

/**
 *  GET请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param cache         缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                         hudString:(NSString *)hudString
                     responseCache:(PPHttpRequestCache)cache
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure
{
    if (![NSObject is_NulllWithObject:hudString])
    {
        [MBProgressHUD showActivityMessageInWindow:hudString];
    }
    
    return [PPNetworkHelper GET:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters responseCache:^(id responseCache)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseCache objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             cache([responseCache objectForKey:NETWORKDATAKEY]);
         }
         
    } success:^(id responseObject)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             success([responseObject objectForKey:NETWORKDATAKEY]);
         }
         else
         {
             failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
         }
     } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
     }];
}

/**
 *  POST请求,无缓存
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                          hudString:(NSString *)hudString
                            success:(PPHttpRequestSuccess)success
                            failure:(PPHttpRequestFailed)failure
{
    if (![NSObject is_NulllWithObject:hudString])
    {
        [MBProgressHUD showActivityMessageInWindow:hudString];
    }
    
    return [PPNetworkHelper POST:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters success:^(id responseObject)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             success([responseObject objectForKey:NETWORKDATAKEY]);
         }
         else
         {
             failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
         }
     } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
     }];
}

/**
 *  POST请求,自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param cache          缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                          hudString:(NSString *)hudString
                      responseCache:(PPHttpRequestCache)cache
                            success:(PPHttpRequestSuccess)success
                            failure:(PPHttpRequestFailed)failure
{
    if (![NSObject is_NulllWithObject:hudString])
    {
        [MBProgressHUD showActivityMessageInWindow:hudString];
    }
    
    return [PPNetworkHelper POST:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters responseCache:^(id responseCache)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseCache objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             cache([responseCache objectForKey:NETWORKDATAKEY]);
         }
         
     } success:^(id responseObject)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             success([responseObject objectForKey:NETWORKDATAKEY]);
         }
         else
         {
             failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
         }
     } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
     }];
}


/**
 *  上传文件
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       文件对应服务器上的字段
 *  @param filePath   文件本地的沙盒路径
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                       hudString:(NSString *)hudString
                                        progress:(PPHttpProgress)progress
                                         success:(PPHttpRequestSuccess)success
                                         failure:(PPHttpRequestFailed)failure
{
    return [PPNetworkHelper uploadFileWithURL:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters name:name filePath:filePath progress:progress success:^(id responseObject)
     {
        if (![NSString is_NulllWithObject:hudString])
        {
            [MBProgressHUD hideHUD];
        }
        
        if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
        {
            success([responseObject objectForKey:NETWORKDATAKEY]);
        }
        else
        {
            failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
        }
    } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
    }];
}

/**
 *  上传单/多张图片
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                         hudString:(NSString *)hudString
                                          progress:(PPHttpProgress)progress
                                           success:(PPHttpRequestSuccess)success
                                           failure:(PPHttpRequestFailed)failure
{
    return [PPNetworkHelper uploadImagesWithURL:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] parameters:parameters name:name images:images fileNames:fileNames imageScale:imageScale imageType:imageType progress:progress success:^(id responseObject)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         if ([[responseObject objectForKey:NETWORKSUCCESSKEY] intValue] == NETWORKSUCCESSCODE)
         {
             success([responseObject objectForKey:NETWORKDATAKEY]);
         }
         else
         {
             failure([responseObject objectForKey:NETWORKFAILUREDATAKEY]);
         }
     } failure:^(NSError *error)
     {
         if (![NSString is_NulllWithObject:hudString])
         {
             [MBProgressHUD hideHUD];
         }
         
         failure(error);
     }];
}

/**
 *  下载文件
 *
 *  @param URL      请求地址
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *  @param progress 文件下载的进度信息
 *  @param success  下载成功的回调(回调参数filePath:文件的路径)
 *  @param failure  下载失败的回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(PPHttpProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(PPHttpRequestFailed)failure
{
    return [PPNetworkHelper downloadWithURL:[NSString stringWithFormat:@"%@%@",APIEHEAD,URL] fileDir:fileDir progress:progress success:success failure:failure];
}

@end
