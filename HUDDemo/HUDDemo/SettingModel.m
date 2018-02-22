//
//  SettingModel.m
//  HUDDemo
//
//  Created by 张冬冬 on 2018/2/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel

- (instancetype)initWithTitle:(NSString *)title selected:(BOOL)selected {
    self = [super init];
    if (self) {
        _title = title;
        _selected = selected;
    }
    return self;
}

@end
