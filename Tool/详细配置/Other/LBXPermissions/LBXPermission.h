//
//  LBXPermission.h
//  LBXKits
//
//  Created by lbx on 2017/9/7.
//  Copyright © 2017年 lbx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBXPermissionSetting.h"


typedef NS_ENUM(NSInteger,LBXPermissionType)
{
    LBXPermissionType_Location,
    LBXPermissionType_Camera,
    LBXPermissionType_Photos,
    LBXPermissionType_Contacts,
    LBXPermissionType_Reminders,
    LBXPermissionType_Calendar,
    LBXPermissionType_Microphone,
    LBXPermissionType_Health,
    LBXPermissionType_DataNetwork//
};

@interface LBXPermission : NSObject

/**
 only effective for location servince,other type reture YES
 @param type permission type,when type is not location,return YES
 @return YES if system location privacy service enabled NO othersize
 只适用于位置服务，其他类型的返回"是"

 */
+ (BOOL)isServicesEnabledWithType:(LBXPermissionType)type;


/**
 whether device support the type
 @param type permission type
 @return  YES if device support
 设备是否支持类型
 */
+ (BOOL)isDeviceSupportedWithType:(LBXPermissionType)type;

/**
 whether permission has been obtained, only return status, not request permission
 for example, u can use this method in app setting, show permission status
 in most cases, suggest call "authorizeWithType:completion" method

 @param type permission type
 @return YES if Permission has been obtained,NO othersize
 是否已获得权限，仅返回状态，而不是请求权限
 例如，U可以在APP设置中使用此方法，显示许可状态
 在大多数情况下，建议调用“授权类型：完成”方法。
 */
+ (BOOL)authorizedWithType:(LBXPermissionType)type;


/**
 request permission and return status in main thread by block.
 execute block immediately when permission has been requested,else request permission and waiting for user to choose "Don't allow" or "Allow"

 @param type permission type
 @param completion May be called immediately if permission has been requested
 granted: YES if permission has been obtained, firstTime: YES if first time to request permission
 在主线程中按块请求和返回状态。
 请求权限时立即执行块，否则请求权限，等待用户选择“不允许”或“允许”。
 */
+ (void)authorizeWithType:(LBXPermissionType)type completion:(void(^)(BOOL granted,BOOL firstTime))completion;





@end
