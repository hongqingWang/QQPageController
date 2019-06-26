//
//  XMChangePosterViewController.m
//  QQPageController
//
//  Created by JiuFuKeJi on 2019/6/19.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "XMChangePosterViewController.h"
#import <WMPageController/WMPageController.h>
#import "XMPosterCollectionViewController.h"

@interface XMChangePosterViewController ()<WMPageControllerDataSource, WMPageControllerDelegate>

@property (nonatomic, strong) WMPageController *pageController;
@property (nonatomic, strong) NSArray *menuTitles;

@end

@implementation XMChangePosterViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"切换海报";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.menuTitles = @[@"全部", @"购物商场", @"开通权益", @"任务单", @"加盟开店"];
    [self.view addSubview:self.pageController.view];
}

#pragma mark - WMPageControllerDataSource
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return self.menuTitles.count;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    
    return self.menuTitles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    if (index % 3 == 0) {
        XMPosterCollectionViewController *collectionVc = [[XMPosterCollectionViewController alloc] init];
        return collectionVc;
    }
    if (index % 3 == 1) {
        UITableViewController *tableViewVc = [[UITableViewController alloc] init];
        return tableViewVc;
    }
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    return vc;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    CGFloat leftMargin = self.pageController.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.pageController.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.pageController.menuView]);
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

#pragma mark - Getters and Setters
- (WMPageController *)pageController {
    if (!_pageController) {
        _pageController = [[WMPageController alloc] init];
        _pageController.dataSource = self;
        _pageController.delegate = self;
        _pageController.automaticallyCalculatesItemWidths = YES;
        _pageController.progressViewIsNaughty = YES;
        _pageController.menuViewStyle = WMMenuViewStyleLine;
        _pageController.progressWidth = 20;
        _pageController.titleSizeNormal = 15;
        _pageController.titleSizeSelected = 15;
        _pageController.titleColorNormal = [UIColor grayColor];
        _pageController.titleColorSelected = [UIColor blueColor];
    }
    return _pageController;
}

@end
