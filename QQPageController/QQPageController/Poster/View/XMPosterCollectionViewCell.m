//
//  XMPosterCollectionViewCell.m
//  PageController
//
//  Created by JiuFuKeJi on 2019/6/18.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "XMPosterCollectionViewCell.h"

@interface XMPosterCollectionViewCell ()

//@property (nonatomic, weak) <#UIImageView#> *<#imageView#>;

@end

@implementation XMPosterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

@end
