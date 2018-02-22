//
//  SettingModel.h
//  HUDDemo
//
//  Created by 张冬冬 on 2018/2/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL selected;
- (instancetype)initWithTitle:(NSString *)title selected:(BOOL)selected;
@end
