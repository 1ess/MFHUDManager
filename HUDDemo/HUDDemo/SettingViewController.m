//
//  SettingViewController.m
//  HUDDemo
//
//  Created by 张冬冬 on 2018/2/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingModel.h"
#import "MFHUDManager.h"
@interface SettingViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;
@end

@implementation SettingViewController

- (NSArray *)list {
    if (!_list) {
        _list = @[
                  @[
                      [[SettingModel alloc] initWithTitle:@"MFHUDTypeNormal" selected:[MFHUDManager hudType] == MFHUDTypeNormal],
                      [[SettingModel alloc] initWithTitle:@"MFHUDTypeLarge" selected:[MFHUDManager hudType] == MFHUDTypeLarge]
                      ],
                  @[
                      [[SettingModel alloc] initWithTitle:@"MFHUDMaskTypeLight" selected:[MFHUDManager maskType] == MFHUDMaskTypeLight],
                      [[SettingModel alloc] initWithTitle:@"MFHUDMaskTypeDark" selected:[MFHUDManager maskType] == MFHUDMaskTypeDark]
                      ]
                  ];
    }
    return _list;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.title = @"setting";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.list.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)self.list[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SettingModel *model = self.list[indexPath.section][indexPath.row];
    cell.textLabel.text = model.title;
    if (model.selected) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SettingModel *model = self.list[indexPath.section][indexPath.row];
    if (model.selected) {
        return;
    }else {
        for (SettingModel *sModel in self.list[indexPath.section]) {
            sModel.selected = NO;
        }
        model.selected = YES;
        if ([model.title isEqualToString:@"MFHUDTypeNormal"]) {
            [MFHUDManager setHUDType:MFHUDTypeNormal];
        }else if ([model.title isEqualToString:@"MFHUDTypeLarge"]) {
            [MFHUDManager setHUDType:MFHUDTypeLarge];
        }else if ([model.title isEqualToString:@"MFHUDMaskTypeLight"]) {
            [MFHUDManager setMaskType:MFHUDMaskTypeLight];
        }else if ([model.title isEqualToString:@"MFHUDMaskTypeDark"]) {
            [MFHUDManager setMaskType:MFHUDMaskTypeDark];
        }
    }
    
    [tableView reloadData];
}

@end
