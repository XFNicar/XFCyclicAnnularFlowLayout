//
//  XFCustomCellectionViewCell.m
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/19.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFCustomCellectionViewCell.h"

@interface XFCustomCellectionViewCell()

@property (nonatomic, strong) UIImageView       *logo;

@end

@implementation XFCustomCellectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"红领巾.jpg"]];
        self.logo.frame = self.bounds;
        [self addSubview:self.logo];
    }
    return self;
}


@end
