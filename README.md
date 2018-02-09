# MFHUDManager
类似于Cosmos应用的HUD效果

- 支持 iOS 9 及以上

## 效果图

<img src="https://github.com/GodzzZZZ/MFHUDManager/blob/master/ScreenShot/B0DF7413B12CE05761A9B39014570CF4.gif" width="33%"/><img src="https://github.com/GodzzZZZ/MFHUDManager/blob/master/ScreenShot/856313FDC0D2B795216E6A0FE65A0DDA.gif" width="33%"/><img src="https://github.com/GodzzZZZ/MFHUDManager/blob/master/ScreenShot/3837853DF02EC7EC7EC5021B9B6685F2.gif" width="33%"/>

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
在 appDelegate 里设置 HUD 的类型

```objc
typedef NS_ENUM(NSInteger, MFHUDMaskType) {
    MFHUDMaskTypeDark,
    MFHUDMaskTypeLight,
};

typedef NS_ENUM(NSInteger, MFHUDType) {
    MFHUDTypeNormal,
    MFHUDTypeLarge,
};

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MFHUDManager setHUDType:MFHUDTypeLarge];
    //[MFHUDManager setHUDType:MFHUDTypeNormal];  -- 默认
    [MFHUDManager setMaskType:MFHUDMaskTypeDark];
    //[MFHUDManager setMaskType:MFHUDMaskTypeLight]; --默认
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
```

## License
MIT
