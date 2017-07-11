//
//  YQtabBarViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/11.
//  Copyright © 2017年 YQ. All rights reserved.
//

#import "YQtabBarViewController.h"
#import "YQTabBar.h"
#import "YQHomeViewController.h"
#import "YQMineViewController.h"


@interface YQtabBarViewController ()<YQTabBarDelegate>

@property(nonatomic,strong)YQHomeViewController * vc1;


@property(nonatomic,strong)YQMineViewController * vc2;

@end

@implementation YQtabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义的set tabbar的情况
    YQTabBar *tabBar = [[YQTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    [self setControllers];

    //直接的是,整个的背景改为 ---> 主色系
//    self.tabBar.tintColor = [UIColor colorWithRed:241.0/255.0 green:93.0/255.0 blue:41.0/255.0 alpha:0.9];

    //设置 TabBarItem的字体的颜色
//    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName:[UIColor colorWithRed:212.0/255.0 green:212.0/255.0 blue:212.0/255.0 alpha:1]} forState:UIControlStateNormal];

}


- (void)setControllers{
    
    //配置的各个tabbar对应的controller
    self.vc1 = [[YQHomeViewController alloc] init];
    self.vc1.view.backgroundColor = [UIColor redColor];
    self.vc1.tabBarItem = [self itemWithSelectedImage:@"store_unchecked.png" image:@"store.png" title:@"首页"];
    
    //配置的各个tabbar对应的controller
    self.vc2 = [[YQMineViewController alloc] init];
    self.vc2.view.backgroundColor = [UIColor blueColor];
    self.vc2.tabBarItem = [self itemWithSelectedImage:@"person_click.png" image:@"person2.png" title:@"个人"];
    
//    //配置的各个tabbar对应的controller
//    self.vc3 = [[UIViewController alloc] init];
//    self.vc3.view.backgroundColor = [UIColor cyanColor];
//    self.vc3.tabBarItem = [self itemWithSelectedImage:@"tabBar_new_icon@2x" image:@"tabBar_new_icon@2x" title:@"发现"];
//    
//    //配置的各个tabbar对应的controller
//    self.vc4 = [[UIViewController alloc] init];
//    self.vc4.view.backgroundColor = [UIColor orangeColor];
//    self.vc4.tabBarItem = [self itemWithSelectedImage:@"tabBar_friendTrends_icon@3x" image:@"tabBar_friendTrends_icon@3x" title:@"我"];
//    
    //统一用tabbar来管理navigationController
    self.viewControllers = @[self.vc1,self.vc2];
    self.tabBar.tintColor = [UIColor greenColor];
//    self.tabBar.barTintColor = [UIColor whiteColor];
    
    
}

- (UITabBarItem *)itemWithSelectedImage:(NSString *)selectImage image:(NSString *)image title:(NSString *)title{
    
    UIImage *im = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:im selectedImage:im];
    
    return item;
    
}


#pragma mark - 自定义Tabbar的代理方法
- (void)tabBarDidClickPlusButton:(YQTabBar *)tabBar{
    // 自定义的tabbar按钮的点击事件:
    // 中间按钮点击了
    
    
    NSLog(@"中间按钮点击了!");
    
}

@end
