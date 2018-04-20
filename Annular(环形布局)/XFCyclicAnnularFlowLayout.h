//
//  XFCyclicAnnularFlowLayout.h
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/19.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFCyclicAnnularFlowLayout;

typedef NS_ENUM(NSUInteger, XFCyclicAnnularItemOrientation) {
    XFCyclicAnnularItemOrientationUp,           // 朝上 默认
    XFCyclicAnnularItemOrientationDown,         // 朝下
    XFCyclicAnnularItemOrientationInside,       // 朝内
    XFCyclicAnnularItemOrientationOutside       // 朝外
};

@protocol XFCyclicAnnularFlowLayoutDelegate <NSObject>




// 当前组有多少个元素
- (NSInteger)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout  numberOfItemsInSection:(NSInteger)section;
// 传入当前组的环绕半径
- (CGFloat)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularRadiusInSection:(NSInteger)section;
// 传入当前组的itemsize
- (CGSize)flowLayout:(XFCyclicAnnularFlowLayout *)flowLayout cyclicAnnularItemSizeInSection:(NSInteger)section;
// 弧度范围
- (CGFloat)cyclicAnnularRadianInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLyout ;

@optional
// 元素朝向
- (XFCyclicAnnularItemOrientation)cyclicAnnularItemOrientationInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLyout;
// 一共有多少组
- (NSInteger)numberOfSectionsInFlowLayout:(XFCyclicAnnularFlowLayout *)flowLayout;



@end

@interface XFCyclicAnnularFlowLayout : UICollectionViewFlowLayout


@property (nonatomic, weak  ) id    <XFCyclicAnnularFlowLayoutDelegate> delegate;

@end
