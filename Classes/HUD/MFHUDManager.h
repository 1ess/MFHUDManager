

#import <Foundation/Foundation.h>
#import "MFNotificationHUD.h"
@interface MFHUDManager : NSObject
//config
+ (void)setHUDType:(MFHUDType)hudType;
+ (void)setMaskType:(MFHUDMaskType)maskType;
//function
+ (BOOL)isShowing;
+ (void)showWarning:(NSString *)warning;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showLoading:(NSString *)loading;
+ (void)dismiss;
@end
