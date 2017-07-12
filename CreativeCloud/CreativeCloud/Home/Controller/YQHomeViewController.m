//
//  YQHomeViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/11.
//  Copyright © 2017年 YQ. All rights reserved.
//  实现的思路: 通过的是 添加两个子控制器来 进行的实现和操作

#import "YQHomeViewController.h"
#import "YQPersonalTableViewController.h"
#import "YQEnterpriseTableViewController.h"


@interface YQHomeViewController ()

@property(nonatomic,strong)YQEnterpriseTableViewController * EnterpriseTvc;

@property(nonatomic,strong)YQPersonalTableViewController * PersonalTvc;


@end

@implementation YQHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器的视图
    [self addChildViewController:self.EnterpriseTvc];
    [self addChildViewController:self.PersonalTvc];
    
    // 添加的是 第一次进来默认的
    [self.view addSubview:self.PersonalTvc.view];
//    [self.view addSubview:self.EnterpriseTvc.view];
    

}


#pragma mark - 懒加载数据

-(YQEnterpriseTableViewController *)EnterpriseTvc{
    if(!_EnterpriseTvc){
        _EnterpriseTvc = [[YQEnterpriseTableViewController alloc]init];
        
    }
    
    return _EnterpriseTvc;

}


-(YQPersonalTableViewController *)PersonalTvc{
    if(!_PersonalTvc){
        _PersonalTvc =  [[YQPersonalTableViewController alloc]init];
    }
    return _PersonalTvc;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}




@end
