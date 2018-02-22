//
//  ViewController.m
//  HUDDemo
//
//  Created by 张冬冬 on 2018/2/22.
//  Copyright © 2018年 张冬冬. All rights reserved.
//

#import "ViewController.h"
#import "MFHUDManager.h"
#import "SettingViewController.h"
@interface ViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *list;
@end

@implementation ViewController

- (NSArray *)list {
    if (!_list) {
        _list = @[
                  @"loading",
                  @"success",
                  @"error",
                  @"warning"
                  ];
    }
    return _list;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [MFHUDManager setHUDType:MFHUDTypeLarge];
    [self.view addSubview:self.tableView];
    self.title = @"HUD Demo";
    UIBarButtonItem *setting = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setting:)];
    self.navigationItem.rightBarButtonItem = setting;
}

- (void)setting:(UIBarButtonItem *)item {
    SettingViewController *setting = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([MFHUDManager isShowing]) {
        return;
    }
    switch (indexPath.row) {
        case 0:
            [MFHUDManager showLoading:@"Loading..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MFHUDManager dismiss];
            });
            break;
        case 1:
            [MFHUDManager showSuccess:@"Success..."];
            
            break;
        case 2:
            [MFHUDManager showError:@"Error..."];
            
            break;
        case 3:
            [MFHUDManager showWarning:@"Warning..."];
            
            break;
        default:
            break;
    }
}


@end
