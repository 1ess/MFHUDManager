//
//  MFNotificationHUD.h
//
//
//
//  Copyright © 2017年 zhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, MFHUDMaskType) {
    MFHUDMaskTypeDark,
    MFHUDMaskTypeLight,
};

typedef NS_ENUM(NSInteger, MFHUDType) {
    MFHUDTypeNormal,
    MFHUDTypeLarge,
};


@interface MFNotificationHUD : NSObject
@property (nonatomic, assign) MFHUDType hudType;
@property (nonatomic, assign) MFHUDMaskType maskType;
@property (nonatomic, assign) BOOL networkActivityIndicatorVisible;
+ (MFNotificationHUD *)shareinstance;
+ (BOOL)isShowing;
+ (void)showMessage:(NSString *)message withIconImageName:(NSString *)iconImageName;
+ (void)showWarning:(NSString *)warning;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showLoading:(NSString *)loading;
+ (void)dismiss;
@end
