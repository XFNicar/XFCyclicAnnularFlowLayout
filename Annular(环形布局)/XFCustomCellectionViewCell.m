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
        self.numLabel.frame = self.bounds;
        [self.logo addSubview:self.numLabel];
       
    }
    return self;
}


- (UILabel *)numLabel {
    if (_numLabel == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentCenter;
        label.textColor         = [UIColor blackColor];
        label.backgroundColor   = [UIColor redColor];
        label.font              = [UIFont systemFontOfSize:12];
        _numLabel               = label;
    }
    return _numLabel;
}

@end
