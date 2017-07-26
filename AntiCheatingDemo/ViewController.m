//
//  ViewController.m
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/5.
//  Copyright © 2017年 leo. All rights reserved.
//

#import "ViewController.h"
#import "TouchEventViewController.h"
#import "AntiCheatingDemo-Swift.h"
#import "JailBroken_CViewController.h"
#import "BaseInfo_CViewController.h"
#include <stdio.h>
#include <Foundation/Foundation.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *functionlist;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title =@"AntiCheating";
    
    _functionlist =@[@"TouchEvent",@"JailBroken",@"JailBroken-c",@"BaseInfo",@"BaseInfo-c"];
    
    UITableView *tableview =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableview.delegate =self;
    tableview.dataSource =self;
    [self.view addSubview:tableview];
    
    
//    UILabel *templab =[[UILabel alloc] initWithFrame:CGRectMake(18, 257, 27, 27)];
//    templab.backgroundColor =[UIColor redColor];
//    [self.view addSubview:templab];
    
    
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _functionlist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellidentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellidentifier];
    }
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =[_functionlist objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"TouchEvent");
            TouchEventViewController *tevc =[[TouchEventViewController alloc] init];
            [self.navigationController pushViewController:tevc animated:YES];
        }
            break;
        case 1:
        {
            NSLog(@"JailBroken");
            JailBrokenViewController * jbvc =[[JailBrokenViewController alloc] init];
            [self.navigationController pushViewController:jbvc animated:YES];
        }
            break;
        case 2:
        {
            NSLog(@"JailBroken-c");
            JailBroken_CViewController * jb_cvc =[[JailBroken_CViewController alloc] init];
            [self.navigationController pushViewController:jb_cvc animated:YES];
        }
            break;
        case 3:
        {
            NSLog(@"BaseInfo");
            BaseInfoViewController * bivc =[[BaseInfoViewController alloc] init];
            [self.navigationController pushViewController:bivc animated:YES];
        }
            break;
        case 4:
        {
            NSLog(@"BaseInfo-c");
            BaseInfo_CViewController * bi_cvc =[[BaseInfo_CViewController alloc] init];
            [self.navigationController pushViewController:bi_cvc animated:YES];
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
