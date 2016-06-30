//
//  ViewController.m
//  RCLuaDemo
//
//  Created by Developer on 16/6/28.
//  Copyright © 2016年 rc.com.ltd. All rights reserved.
//

#import "ViewController.h"
#import "RCLuaViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *names;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configLuaView];
}


- (void)configLuaView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"LuaView 测试Demo";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGRect rect = self.view.bounds;
    self.tableView = [[UITableView alloc]initWithFrame:rect];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    NSArray *urlArray = [[NSBundle mainBundle]URLsForResourcesWithExtension:@"lua" subdirectory:nil];
    NSMutableArray *namesArray = [[NSMutableArray alloc]init];
    for (int i = 0;  i < urlArray.count; i ++) {
        NSURL *url = urlArray[i];
        NSString *name = url.relativeString;
        [namesArray addObject:name];
    }
    self.names = namesArray;
    [LViewController disableReloadKeyCommand:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"default.identifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if( cell==nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* name =  self.names[indexPath.row];
    RCLuaViewController* c = [[RCLuaViewController alloc] initWithPackage:nil mainScript:name];
    [self.navigationController pushViewController:c animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
