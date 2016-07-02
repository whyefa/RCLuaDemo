//
//  RCLVImage.m
//  RCLuaDemo
//
//  Created by Developer on 16/7/1.
//  Copyright © 2016年 rc.com.ltd. All rights reserved.
//

#import "RCLVImage.h"
#import "LVBaseView.h"
#import "LVUtil.h"
#import "LVData.h"
#import <SDWebImage/UIImageView+WebCache.h>


@implementation RCLVImage

- (void)setWebImageUrl:(NSURL *)url finished:(LVLoadFinished)finished {
    NSLog(@"什么鬼");
    __weak RCLVImage *weakImageView = self;
    [self sd_setImageWithURL:url placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        double duration = (cacheType == SDImageCacheTypeNone && !error) ? .4f: .0f;
        if (duration > 0) {
            weakImageView.alpha = 1.0f;
            [UIView animateWithDuration:duration animations:^{
                weakImageView.alpha = 1.0f;
            }];
        }else {
            weakImageView.alpha = 1.0f;
        }
        if (finished) {
            finished(error);
        }
    }];
}


@end
