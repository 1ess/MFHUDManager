

#import "MFHUDManager.h"

@implementation MFHUDManager
+ (void)setHUDType:(MFHUDType)hudType {
    [MFNotificationHUD shareinstance].hudType = hudType;
}
+ (void)setMaskType:(MFHUDMaskType)maskType {
    [MFNotificationHUD shareinstance].maskType = maskType;
}
+ (void)setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [MFNotificationHUD shareinstance].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
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
