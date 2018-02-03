//
//  ZHNTopHud.m
//  ZHNCosmos
//
//  Created by zhn on 2017/10/31.
//  Copyright © 2017年 zhn. All rights reserved.
//

#import "MFNotificationHUD.h"
#import "MFMacro.h"
#import "UIView+MFFrame.h"
static BOOL _showing;
static BOOL _indicatorVisible;
@interface MFNotificationHUD()
@property (nonatomic, strong) UIWindow *hudWindow;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIImageView *hudContainerView;
@property (nonatomic, strong) UIVisualEffectView *blurEffectView;
@property (nonatomic, strong) NSTimer *dismissTimer;
@end

@implementation MFNotificationHUD
+ (MFNotificationHUD *)shareinstance {
    static MFNotificationHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // hud
        hud = [[MFNotificationHUD alloc] init];
        hud.networkActivityIndicatorVisible = YES;
        UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        hud.hudWindow = window;
        UIViewController *tempRootViewController = [[UIViewController alloc] init];
        tempRootViewController.view.userInteractionEnabled = NO;
        window.rootViewController = tempRootViewController;
        window.userInteractionEnabled = NO;
        window.windowLevel = UIWindowLevelStatusBar + 999;
        // containerView
        
        UIImageView *containerView = [[UIImageView alloc] initWithFrame:CGRectMake(KLeftContentInset, kTopContentInset, Width - 2 * KLeftContentInset, kContentHeight)];
        hud.hudContainerView = containerView;
        hud.hudContainerView.backgroundColor = [UIColor clearColor];
        [window addSubview:containerView];
        containerView.layer.cornerRadius = KCornerRadius;
        
        // blureffect
        UIVisualEffectView *blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        blurView.layer.cornerRadius = KCornerRadius;
        blurView.clipsToBounds = YES;
        hud.blurEffectView = blurView;
        blurView.frame = containerView.bounds;
        [containerView addSubview:blurView];
        // icon
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [containerView addSubview:iconImageView];
        CGFloat yDelta = (kContentHeight - 20) / 2;
        iconImageView.frame = CGRectMake(10, yDelta, 20, 20);
        hud.iconImageView = iconImageView;
        //indicator
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        indicatorView.hidesWhenStopped = YES;
        indicatorView.center = CGPointMake(20, yDelta + 10);
        [containerView addSubview:indicatorView];
        hud.indicatorView = indicatorView;
        // title
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        hud.titleLabel = titleLabel;
        hud.titleLabel.textColor = [UIColor blackColor];
        [containerView addSubview:titleLabel];
    
        titleLabel.frame = CGRectMake(40, 0, Width - 50, kContentHeight);
        // shadow
        containerView.layer.shadowColor = [UIColor whiteColor].CGColor;
        containerView.layer.shadowOpacity = 0.5;
        containerView.layer.shadowOffset = CGSizeMake(0, 2);
        // transform
        containerView.transform = CGAffineTransformMakeTranslation(0, - (kContentHeight + kTopContentInset));
    });
    return hud;
}

- (void)setHudType:(MFHUDType)hudType {
    _hudType = hudType;
    MFNotificationHUD *hud = [MFNotificationHUD shareinstance];
    CGFloat height = hudType == MFHUDTypeNormal ? kContentHeight : 50;
    CGFloat y = hudType == MFHUDTypeNormal ? (kContentHeight - 20) / 2 : 15;
    dispatch_async(dispatch_get_main_queue(), ^{
            hud.hudContainerView.height = height;
            hud.blurEffectView.height = height;
            hud.iconImageView.y = y;
            hud.indicatorView.y = y;
            hud.titleLabel.height = height;
   });
}

- (void)setMaskType:(MFHUDMaskType)maskType {
    _maskType = maskType;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIBlurEffectStyle style = maskType == MFHUDMaskTypeLight ? UIBlurEffectStyleExtraLight : UIBlurEffectStyleDark;
        UIColor *textColor = maskType == MFHUDMaskTypeLight ? [UIColor blackColor] : [UIColor whiteColor];
        UIColor *shadowColor = maskType == MFHUDMaskTypeLight ? [UIColor blackColor] : [UIColor whiteColor];
        MFNotificationHUD *hud = [MFNotificationHUD shareinstance];
        hud.blurEffectView.effect = [UIBlurEffect effectWithStyle:style];
        hud.titleLabel.textColor = textColor;
        hud.hudContainerView.layer.shadowColor = shadowColor.CGColor;
    });
    
}

- (void)setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    _networkActivityIndicatorVisible = networkActivityIndicatorVisible;
    _indicatorVisible = networkActivityIndicatorVisible;
}

+ (BOOL)isShowing {
    return _showing;
}

+ (void)showLoadingWithMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        _showing = YES;
        if (_indicatorVisible) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        }else {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
        [MFNotificationHUD shareinstance].iconImageView.image = nil;
        [MFNotificationHUD shareinstance].titleLabel.text = message;
        [MFNotificationHUD shareinstance].hudWindow.hidden = NO;
        [[MFNotificationHUD shareinstance].indicatorView startAnimating];
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveLinear animations:^{
            [MFNotificationHUD shareinstance].hudContainerView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    });
}

+ (void)showMessage:(NSString *)message withIconImageName:(NSString *)iconImageName {
    dispatch_async(dispatch_get_main_queue(), ^{
        _showing = YES;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [[MFNotificationHUD shareinstance].indicatorView stopAnimating];
        [MFNotificationHUD shareinstance].iconImageView.image = [UIImage imageNamed:iconImageName];
        [MFNotificationHUD shareinstance].titleLabel.text = message;
        [MFNotificationHUD p_delayDismissAnimate];
        [MFNotificationHUD shareinstance].hudWindow.hidden = NO;
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:2 options:UIViewAnimationOptionCurveLinear animations:^{
            [MFNotificationHUD shareinstance].hudContainerView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
    });
}

+ (void)showLoading:(NSString *)loading {
    [MFNotificationHUD showLoadingWithMessage:loading];
}

+ (void)showSuccess:(NSString *)success {
    [MFNotificationHUD showMessage:success withIconImageName:@"notice_type_success"];
}

+ (void)showError:(NSString *)error {
    [MFNotificationHUD showMessage:error withIconImageName:@"notice_type_error"];
    [self tapticEngine];
}

+ (void)showWarning:(NSString *)warning {
    [MFNotificationHUD showMessage:warning withIconImageName:@"notice_type_warnning"];
    [self tapticEngine];
}

+ (void)tapticEngine {
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
    [generator prepare];
    [generator impactOccurred];
}

+ (void)dismiss {
    CGFloat height = [MFNotificationHUD shareinstance].hudType == MFHUDTypeNormal ? kContentHeight : 50;
    [UIView animateWithDuration:0.3 animations:^{
        [MFNotificationHUD shareinstance].hudContainerView.transform = CGAffineTransformMakeTranslation(0, - height - kTopContentInset - 30);
    } completion:^(BOOL finished) {
        [MFNotificationHUD shareinstance].hudWindow.hidden = YES;
        _showing = NO;
    }];
}

+ (void)p_delayDismissAnimate {
    MFNotificationHUD *hud = [MFNotificationHUD shareinstance];
    // clear old timer
    [hud.dismissTimer invalidate];
    hud.dismissTimer = nil;
    // init new timer
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [MFNotificationHUD dismiss];
    }];
    hud.dismissTimer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
@end
