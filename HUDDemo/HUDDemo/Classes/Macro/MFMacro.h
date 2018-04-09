//
//  Created by 张冬冬.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#ifndef MFMacro_h
#define MFMacro_h

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
#define isIphoneX (Height == 812)
#define kTopContentInset (isIphoneX ? 35 : 10)
#define KLeftContentInset 8
#define KCornerRadius 8
#define kContentHeight 36
#endif /* MFMacro_h */
