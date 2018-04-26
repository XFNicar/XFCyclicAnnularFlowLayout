//
//  ViewController.m
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/19.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "ViewController.h"
#import "XFCyclicAnnularFlowLayout.h"
#import "XFCustomCellectionViewCell.h"

@interface ViewController ()
<
XFCyclicAnnularFlowLayoutDelegate,
UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout
>


@property (nonatomic ,strong) UICollectionView      *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *sub_strs = @[@"1",@"3",@"5",@"7",@"9"];
    NSMutableString *numberStr = [[NSMutableString alloc]initWithString: @"3267436217453761"];
    for (int index = 0; index < sub_strs.count; index ++) {
        NSString *locStr = sub_strs[index];
        while ([numberStr rangeOfString:locStr].location != NSNotFound) {
            NSRange range = [numberStr rangeOfString:locStr];
            NSString *repStr = [self letterWithNumber:[locStr  integerValue]];
            [numberStr replaceCharactersInRange:range withString:repStr];
        }
    }
    
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)fibonacciValueWithNumber:(NSInteger)number {
    switch (number) {
        case 1:
            return 1;
            break;
        case 3:
            return 2;
            break;
        case 5:
            return 3;
            break;
        case 7:
            return 5;
            break;
        case 9:
            return 8;
            break;
        default:
            return 0;
            break;
    }
}

- (NSString *)letterWithNumber:(NSInteger)number {
    NSInteger fibonacciValue = [self fibonacciValueWithNumber:number];
    fibonacciValue += 96;
    return [NSString stringWithFormat:@"%c", (int)fibonacciValue];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XFCustomCellectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CV_CELL" forIndexPath:indexPath];
    cell.numLabel.text = [NSString stringWithFormat:@"%ld-%ld",indexPath.section,indexPath.row];
    
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
    return 2* M_PI / 2 ;
}


- (XFCyclicAnnularItemOrientation)cyclicAnnularItemOrientationInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLyout {
    return XFCyclicAnnularItemOrientationOutside;
}

- (BOOL)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicIsClockwiseInSection:(NSInteger)section {
    return NO;
}


- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        XFCyclicAnnularFlowLayout *customLayout = [[XFCyclicAnnularFlowLayout alloc] init]; // 自定义的布局对象
        customLayout.minimumLineSpacing = 5;
        customLayout.minimumInteritemSpacing = 5;
        customLayout.delegate = self;
        customLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:customLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.scrollEnabled = YES;
        collectionView.alwaysBounceHorizontal = YES;
        // 注册cell、sectionHeader、sectionFooter
        [collectionView registerClass:[XFCustomCellectionViewCell class] forCellWithReuseIdentifier:@"CV_CELL"];
//        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CV_CELL"];
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CV_HEADER"];
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CV_FOOTER"];
        _collectionView = collectionView;
    }
    return _collectionView;
}


@end
