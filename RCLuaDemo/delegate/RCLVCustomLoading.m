//
//  RCLVCustomLoading.m
//  RCLuaDemo
//
//  Created by Developer on 16/7/1.
//  Copyright © 2016年 rc.com.ltd. All rights reserved.
//

#import "RCLVCustomLoading.h"

@interface RCLVCustomLoading ()

@property(nonatomic, strong) UIActivityIndicatorView * loading;

@end


@implementation RCLVCustomLoading

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.loading = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.loading sizeToFit];
        [self.loading startAnimating];
        [self addSubview:self.loading];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.loading) {
        self.loading.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    }
}

@end
