//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import "MFHUDManager.h"

@implementation MFHUDManager

+ (MFHUDType)hudType {
    return [MFNotificationHUD shareinstance].hudType;
}

+ (MFHUDMaskType)maskType {
    return [MFNotificationHUD shareinstance].maskType;
}

+ (void)setHUDType:(MFHUDType)hudType {
    [MFNotificationHUD shareinstance].hudType = hudType;
}
+ (void)setMaskType:(MFHUDMaskType)maskType {
    [MFNotificationHUD shareinstance].maskType = maskType;
}
+ (BOOL)isShowing {
    return [MFNotificationHUD isShowing];
}
+ (void)showWarning:(NSString *)warning {
    [MFNotificationHUD showWarning:warning];
}
+ (void)showSuccess:(NSString *)success {
    [MFNotificationHUD showSuccess:success];
}
+ (void)showError:(NSString *)error {
    [MFNotificationHUD showError:error];
}
+ (void)showLoading:(NSString *)loading {
    [MFNotificationHUD showLoading:loading];
}
+ (void)dismiss {
    [MFNotificationHUD dismiss];
}
@end
