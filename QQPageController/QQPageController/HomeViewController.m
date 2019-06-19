//
//  HomeViewController.m
//  QQPageController
//
//  Created by JiuFuKeJi on 2019/6/19.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - Events
- (void)didClickButton:(UIButton *)button {
    
    NSLog(@"dasda");
}

#pragma mark - SetupUI
- (void)setupUI {
    
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.button];
    self.button.frame = CGRectMake(100, 100, 100, 44);
}

#pragma mark - Getters and Setters
- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"Button" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
