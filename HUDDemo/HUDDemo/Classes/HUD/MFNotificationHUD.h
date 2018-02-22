//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, MFHUDMaskType) {
    MFHUDMaskTypeLight,
    MFHUDMaskTypeDark,
};

typedef NS_ENUM(NSInteger, MFHUDType) {
    MFHUDTypeNormal,
    MFHUDTypeLarge,
};


@interface MFNotificationHUD : NSObject
@property (nonatomic, assign) MFHUDType hudType;
@property (nonatomic, assign) MFHUDMaskType maskType;
+ (MFNotificationHUD *)shareinstance;
+ (BOOL)isShowing;
+ (void)showMessage:(NSString *)message withIconImageName:(NSString *)iconImageName;
+ (void)showWarning:(NSString *)warning;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showLoading:(NSString *)loading;
+ (void)dismiss;
@end
