//
//  ViewController.m
//  Annular(环形布局)
//
//  Created by YanYi on 2018/4/19.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "ViewController.h"
#import "XFSignInAlertView.h"

@interface ViewController ()

@property (nonatomic, strong) XFSignInAlertView     *signInAlert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.signInAlert];
    self.signInAlert.center = self.view.center;
}




- (XFSignInAlertView *)signInAlert {
    if (_signInAlert == nil) {
        _signInAlert = [[XFSignInAlertView alloc]initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 2 + 30)];
    }
    return _signInAlert;
}


@end
