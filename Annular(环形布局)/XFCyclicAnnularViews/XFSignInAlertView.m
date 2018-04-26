//
//  XFSignInAlertView.m
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/20.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSignInAlertView.h"

#import "XFCyclicAnnularFlowLayout.h"
#import "XFSignAlertViewCVCell.h"

@interface XFSignInAlertView ()
<
XFCyclicAnnularFlowLayoutDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic ,strong) UICollectionView      *collectionView;


@end

@implementation XFSignInAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.collectionView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.collectionView];
        [self.collectionView reloadData];
    }
    return self;
}

- (void)updateWithSignInfoData:(id)data {
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XFSignAlertViewCVCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CV_CELL" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        cell.layer.cornerRadius = 20;
    } else if (indexPath.section == 1) {
        cell.layer.cornerRadius = 16.25;
    } else {
        cell.layer.cornerRadius = 12.5;
    }
    return cell;
}

//- collectionitem


// 一共有多少组
- (NSInteger)numberOfSectionsInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLayout {
    return 3;
}
// 当前组有多少个元素
- (NSInteger)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout  numberOfItemsInSection:(NSInteger)sectio {
    return 10;
}
// 传入当前组的环绕半径
- (CGFloat)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularRadiusInSection:(NSInteger)section {
    if (section == 0) {
        return 160;
    } else if (section == 1) {
        return 120;
    } else {
        return 80;
    }
    
}
// 传入当前组的itemsize
- (CGSize)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularItemSizeAtindexPath:(NSIndexPath *)indexPath; {
    
    
    if (indexPath.section == 0) {
        return CGSizeMake(40, 40);
    } else if (indexPath.section == 1) {
        return CGSizeMake(32.5, 32.5);
    } else {
        return CGSizeMake(25, 25);
    }
}


// 弧度范围
- (CGFloat)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularRadianInSection:(NSInteger)section {
    return 2 * M_PI / 2 ;
}


- (XFCyclicAnnularItemOrientation)cyclicAnnularItemOrientationInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLyout {
    return XFCyclicAnnularItemOrientationOutside;
}

- (BOOL)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicIsClockwiseInSection:(NSInteger)section {
    return YES;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        XFCyclicAnnularFlowLayout *customLayout = [[XFCyclicAnnularFlowLayout alloc] init]; // 自定义的布局对象
        customLayout.minimumLineSpacing = 5;
        customLayout.minimumInteritemSpacing = 5;
        customLayout.delegate = self;
        customLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:customLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.scrollEnabled = YES;
        collectionView.clipsToBounds = NO;
        // 注册cell、sectionHeader、sectionFooter
        [collectionView registerClass:[XFSignAlertViewCVCell class] forCellWithReuseIdentifier:@"CV_CELL"];

        _collectionView = collectionView;
    }
    return _collectionView;
}


@end
