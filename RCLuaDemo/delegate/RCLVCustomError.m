//
//  RCLVCustomError.m
//  RCLuaDemo
//
//  Created by Developer on 16/7/1.
//  Copyright © 2016年 rc.com.ltd. All rights reserved.
//

#import "RCLVCustomError.h"

@implementation RCLVCustomError
{
    UIView *_backView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
        _backView.backgroundColor = [UIColor clearColor];

        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 50, 120, 46)];
        [button setTitle:@"刷新" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = button.frame.size.height/2;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        button.showsTouchWhenHighlighted = YES;
        [_backView addSubview:button];
        [self addSubview:_backView];
        [button addTarget:self action:@selector(refleshButtonCall) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)refleshButtonCall {
    [self callLuaWithArguments:@[@"reflesh", @"test", @"temp"]];
    [self callLuaWithArgument:@"refleshend"];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _backView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
}

- (id)lv_getNativeView {
    return _backView;
}

@end
