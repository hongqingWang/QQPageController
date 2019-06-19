//
//  XMPosterCollectionViewController.m
//  PageController
//
//  Created by JiuFuKeJi on 2019/6/18.
//  Copyright © 2019 JiuFuKeJi. All rights reserved.
//

#import "XMPosterCollectionViewController.h"
#import "XMPosterCollectionViewCell.h"

@interface XMPosterCollectionViewController ()

@property (nonatomic, strong) NSArray *imageNames;

@end

@implementation XMPosterCollectionViewController

static NSString * const reuseIdentifier = @"XMPosterCollectionViewCell";

static const CGFloat kPosterItemLineSpacing = 10.f; // 列间距
static const CGFloat kPosterItemSpacing = 15.f;     // item之间的间距、item距左右两边的距离
static const NSInteger kPosterRowNumber = 2;        // 列数

- (instancetype)init {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = kPosterItemLineSpacing;
    flowLayout.minimumInteritemSpacing = kPosterItemSpacing;
    CGFloat width = ([[UIScreen mainScreen] bounds].size.width - (kPosterRowNumber + 1) * kPosterItemSpacing) / kPosterRowNumber ;
    CGFloat height = width * 667 / 375;
    flowLayout.itemSize = CGSizeMake(width, height);
    flowLayout.sectionInset = UIEdgeInsetsMake(kPosterItemLineSpacing, kPosterItemSpacing, kPosterItemLineSpacing, kPosterItemSpacing);
    self = [self initWithCollectionViewLayout:flowLayout];
    if (self) {
        // insert code here...
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageNames = @[
                        @"01.jpg",
                        @"02.jpg",
                        @"03.jpg"
                        ];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[XMPosterCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XMPosterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSInteger i = indexPath.row % self.imageNames.count;
    NSString *imageName = self.imageNames[i];
    cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%zd", indexPath.item);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
