# MFHUDManager
类似于<Cosmos>应用的HUD效果

- 支持 iOS 9 及以上

## 效果图

<img src="https://raw.githubusercontent.com/EnjoySR/ESPictureBrowser/master/ScreenShot/2016-10-16_23_20_11.gif" width="33%"/><img src="https://raw.githubusercontent.com/EnjoySR/ESPictureBrowser/master/ScreenShot/2016-10-16_23_22_23.gif" width="33%"/><img src="https://raw.githubusercontent.com/EnjoySR/ESPictureBrowser/master/ScreenShot/2016-10-16_23_24_43.gif" width="33%"/>

## 集成方式
- cocoapod

```
pod 'MFHUDManager'
```

## 使用方式
- 导入

```
#import "MFHUDManager.h"
```

- 初始化并显示
在 appDelegate 里初始化, 并设置 HUD 的类型

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MFHUDManager setHUDType:MFHUDTypeLarge];
}
```

- 调用方法即可

```objc

    [MFHUDManager showLoading:@"..."];
    [MFHUDManager showSuccess:@"..."];
    [MFHUDManager showError:@"..."];
    [MFHUDManager showWarning:@"..."];

}
```
注意: show 方法会自动 hide, 如果要手动隐藏可以显示调用 dismiss
```objc
    [MFHUDManager dismiss];
```

- 其他配置

```objc
+ (void)setHUDType:(MFHUDType)hudType;
+ (void)setMaskType:(MFHUDMaskType)maskType;
+ (void)setNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;
```

## License
MIT
