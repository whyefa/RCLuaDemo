    //
    //  RCLuaViewController.m
    //  RCLuaDemo
    //
    //  Created by Developer on 16/6/28.
    //  Copyright © 2016年 rc.com.ltd. All rights reserved.
    //

#import "RCLuaViewController.h"
#import "LView.h"
#import "RCLVCustomError.h"
#import "RCLVCustomLoading.h"
#import "RCLVImage.h"
#import "LVImage.h"
#import "RCLVButton.h"
#import "LVButton.h"

@interface RCLuaViewController ()

@end

@implementation RCLuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [LVImage setDefaultStyle:[RCLVImage class]];
    [LVButton setDefaultStyle:[RCLVButton class]];
}

- (void)dealloc {
    [self.lv releaseLuaView];
}

- (void)willCreateLuaView {
    [super willCreateLuaView];
    while (self.view.subviews.count) {
        UIView *child = self.view.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (void)didCreateLuaView:(LView *)view {
    [super didCreateLuaView:view];

        // 注册 用户面板类型
    self.lv[@"CustomError"] = [RCLVCustomError class];
    self.lv[@"CustomLoading"] = [RCLVCustomLoading class];

        // 注册 外部对象.
    self.lv[@"viewController"] = self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.lv viewDidAppear];
}

-(void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.lv viewDidDisAppear];
}

-(void) openUrl:(NSString*)actionUrl{
    LVLog(@"%@",actionUrl);
}

-(void) gotoHistory{
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSDictionary*) testJson:(NSDictionary*) dic{
    NSLog(@"%@", dic);
    return dic;
}

-(void) test:(id) object{
    NSLog(@"%@", object);
}

- (void)setLuaBox {
    NSLog(@"box: ");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}


@end
