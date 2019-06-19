//
//  HomeViewController.m
//  QQPageController
//
//  Created by JiuFuKeJi on 2019/6/19.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "HomeViewController.h"
#import "XMChangePosterViewController.h"
#import "XMPosterCollectionViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) XMPosterCollectionViewController *collectionVc;

@end

@implementation HomeViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"XMPosterChangedNotification" object:nil];
}

#pragma mark - Events
- (void)didClickButton:(UIButton *)button {
    
    XMChangePosterViewController *vc = [[XMChangePosterViewController alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didRecievePosterNotification:) name:@"XMPosterChangedNotification" object:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - didRecievePosterNotification
- (void)didRecievePosterNotification:(NSNotification *)notification {
    
    NSLog(@"notification = %@", notification.userInfo[@"url"]);
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

- (XMPosterCollectionViewController *)collectionVc {
    if (_collectionVc == nil) {
        _collectionVc = [[XMPosterCollectionViewController alloc] init];
    }
    return _collectionVc;
}

@end
