//
//  RCLVButton.m
//  RCLuaDemo
//
//  Created by Developer on 16/7/1.
//  Copyright © 2016年 rc.com.ltd. All rights reserved.
//

#import "RCLVButton.h"
#import "LVBaseView.h"
#import "RCLVImage.h"
#import "LVUtil.h"
#import "LView.h"
#import <SDWebImage/UIButton+WebCache.h>
#import "LVStyledString.h"

@implementation RCLVButton

- (void)setWebImageUrl:(NSString *)url forState:(UIControlState)state finished:(LVLoadFinished)finished
{
    [self sd_setBackgroundImageWithURL:[NSURL URLWithString:url] forState:UIControlStateNormal];
}


@end
