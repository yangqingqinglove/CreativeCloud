//
//  YQMineViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/11.
//
//
// 隐藏navbar 的背景颜色,设置left 和 right


#import "YQMineViewController.h"

@interface YQMineViewController ()



@end

@implementation YQMineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //1.设置nav 的大的透明的背景
    UIImage * image = [[UIImage alloc]init];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    //去横线去阴影的方法
    if ([self.navigationController.navigationBar respondsToSelector:@selector(shadowImage)])
    {
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    }
    
    //2.设置rightBar
    UIButton * rightBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBnt.backgroundColor = [UIColor clearColor];//设置透明
    [rightBnt addTarget:self action:@selector(rightBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [rightBnt setImage:[UIImage imageNamed:@"set_up"] forState:UIControlStateNormal];
    [rightBnt sizeToFit];
    UIBarButtonItem * bntItem = [[UIBarButtonItem alloc]initWithCustomView:rightBnt];
    self.navigationItem.rightBarButtonItems = @[bntItem];
   
    
    //3.设置leftBar
    UIButton * leftBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBnt.backgroundColor = [UIColor clearColor];//设置透明
    [leftBnt addTarget:self action:@selector(leftBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [leftBnt setImage:[UIImage imageNamed:@"bells"] forState:UIControlStateNormal];
    [leftBnt sizeToFit];
    UIBarButtonItem * imageItem = [[UIBarButtonItem alloc]initWithCustomView:leftBnt];
    self.navigationItem.leftBarButtonItem = imageItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];


}

#pragma mark - navBar的按钮点击方法

-(void)rightBarButtonClicked:(UIButton *)right{


}

-(void)leftBarButtonClicked:(UIButton *)left{


}


@end
