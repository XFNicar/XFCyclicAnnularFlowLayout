//
//  XFSignAlertViewCVCell.m
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/20.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSignAlertViewCVCell.h"

#define VALUE_RANDOM ((arc4random()%256) / 255.f)
#define COLOR_RANDOM [UIColor colorWithRed:VALUE_RANDOM green:VALUE_RANDOM blue:VALUE_RANDOM alpha:1]

@interface XFSignAlertViewCVCell()

@property (nonatomic, strong) UIImageView       *logo;


@end

@implementation XFSignAlertViewCVCell



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //        self.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"红领巾.jpg"]];
        self.logo = [[UIImageView alloc]init];
        self.logo.frame = self.bounds;
        [self addSubview:self.logo];
        self.numLabel.frame = self.bounds;
        [self.logo addSubview:self.numLabel];
        
        self.logo.backgroundColor = COLOR_RANDOM;
        self.clipsToBounds = YES;
    }
    return self;
}


- (UILabel *)numLabel {
    if (_numLabel == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentCenter;
        label.textColor         = [UIColor redColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont systemFontOfSize:12];
        _numLabel               = label;
    }
    return _numLabel;
}


@end
