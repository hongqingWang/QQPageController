//
//  UINavigationController+Category.m
//  QQPageController
//
//  Created by JiuFuKeJi on 2019/6/19.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "UINavigationController+Category.h"

@implementation UINavigationController (Category)

+ (UINavigationController *)currentNavigationController {
    
    if (![[UIApplication sharedApplication].windows.lastObject isKindOfClass:[UIWindow class]]) {
        NSAssert(0, @"未获取到导航控制器");
        return nil;
    }
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [self getCurrentNavigationControllerFromViewController:rootViewController];
}

// 递归查找
+ (UINavigationController *)getCurrentNavigationControllerFromViewController:(UIViewController *)viewController {
    
    if ([viewController isKindOfClass:[UITabBarController class]]) {
        UINavigationController *nc = ((UITabBarController *)viewController).selectedViewController;
        return [self getCurrentNavigationControllerFromViewController:nc];
        
    } else if ([viewController isKindOfClass:[UINavigationController class]]) {
        
        if (((UINavigationController *)viewController).presentedViewController) {
            return [self getCurrentNavigationControllerFromViewController:((UINavigationController *)viewController).presentedViewController];
        }
        return [self getCurrentNavigationControllerFromViewController:((UINavigationController *)viewController).topViewController];
    
    } else if ([viewController isKindOfClass:[UIViewController class]]) {
        
        if (viewController.presentedViewController) {
            return [self getCurrentNavigationControllerFromViewController:viewController.presentedViewController];
        }
        else {
            return viewController.navigationController;
        }
        
    } else {
        
        NSAssert(0, @"未获取到导航控制器");
        return nil;
    }
}

@end
