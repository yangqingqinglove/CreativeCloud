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
#import "YQCategoryView.h"
#import "Masonry.h"

@interface YQHomeViewController ()<UIGestureRecognizerDelegate,YQCatergoryBtnClickDelegate>

// 添加的子控制器的属性
@property(nonatomic,strong)YQEnterpriseTableViewController * EnterpriseTvc;

@property(nonatomic,strong)YQPersonalTableViewController * PersonalTvc;

// 添加的置顶的视图控件
@property (weak, nonatomic) IBOutlet UIView *navBar;
@property (weak, nonatomic) IBOutlet UIButton *personalBtn;
@property (weak, nonatomic) IBOutlet UIButton *enterpriseBtn;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIImageView *navBackImage;


// 通知监听的属性:
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property(nonatomic,assign)CGFloat contentoffset;

// 分类的视图
@property(nonatomic,strong)YQCategoryView * categoryView;



@end

@implementation YQHomeViewController

#pragma mark - view视图的生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器的视图
    [self addChildViewController:self.EnterpriseTvc];
    [self addChildViewController:self.PersonalTvc];
    
    // 添加的是 第一次进来默认的
    [self.view addSubview:self.EnterpriseTvc.view];
    [self.view addSubview:self.PersonalTvc.view];
    self.personalBtn.selected = YES;
    
    // 添加categoryView的窗口
    YQCategoryView * categoryView = [YQCategoryView CategoryViewMenu];
    categoryView.delegate = self;
    [self.view addSubview:categoryView];
    self.categoryView = categoryView;
    self.categoryView.hidden = YES;
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navBar.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(8);
        make.right.equalTo(self.view.mas_right).offset(-8);
        make.height.equalTo(@140);
        
    }];
    [self.view bringSubviewToFront:self.categoryView];
    
    
    //接受各种通知的情况
    [self addNoties];
    
    //添加,手势,长按和 点动
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    pan.delegate = self ;
    [self.topImageView addGestureRecognizer:pan];
    [self.topImageView addGestureRecognizer:tap];
    
    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    // layoutSubViews只要是视图 添加和创建之后就会调用的该方法
    // 设置置顶视图的
    [self.view bringSubviewToFront:self.navBar];
    [self.view bringSubviewToFront:self.topImageView];

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


#pragma mark - Top BUTTON的点击事件
- (IBAction)personalBtnClick:(UIButton *)sender {
    // 个人的按钮的点击事件:
    if(sender.selected){
        
        self.enterpriseBtn.selected =NO;
        
    }else{
        
        self.personalBtn.selected = YES;
        self.enterpriseBtn.selected =NO;
        // 视图的添加移除
//        [self.view addSubview: self.PersonalTvc.view];
        self.PersonalTvc.view.hidden = NO;
        self.EnterpriseTvc.view.hidden = YES;
    
    }
    
}

- (IBAction)enterpriseBtnClick:(UIButton *)sender {
    // 企业的按钮的点击事件:
    if(sender.selected){
        self.personalBtn.selected = !sender.selected;
        
    }else{
        
        self.personalBtn.selected = NO ;
        self.enterpriseBtn.selected = YES;
        // 视图的添加移除
//        [self.view addSubview: self.EnterpriseTvc.view];
//        [self.PersonalTvc.view  removeFromSuperview];
        self.PersonalTvc.view.hidden = YES;
        self.EnterpriseTvc.view.hidden = NO;
        
    }
    
}

#pragma mark - 监听通知的方法
-(void)addNoties{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(childTableViewContentOffSetsChage:) name:@"YQContentoffSetsNoties" object:nil];

}

#pragma mark - 执行通知的方法
-(void)childTableViewContentOffSetsChage:(NSNotification *)noties{
    
    CGFloat offsets = [noties.userInfo[@"ContentoffSets"] floatValue];
    
    if (offsets > self.contentoffset ) {
        
        [UIView animateWithDuration:0.25 animations:^{
            //是设置显示
            self.searchBar.hidden = NO;
            self.leftButton.hidden = NO;
            self.rightButton.hidden = NO;
            
            self.enterpriseBtn.hidden = YES;
            self.personalBtn.hidden = YES;
            
            
            self.navBackImage.alpha = 1;
            self.navBackImage.hidden = NO;
        }];

        
    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            
            //是设置显示
            self.searchBar.hidden = YES;
            self.leftButton.hidden = YES;
            self.rightButton.hidden = YES;
            
            self.enterpriseBtn.hidden = NO;
            self.personalBtn.hidden = NO;
            

            self.navBackImage.alpha = 0;
            self.navBackImage.hidden = YES;
            
        }];
    }
    
    
    self.contentoffset = offsets;
    NSLog(@"offsets === %f", offsets);
}

#pragma mark - 添加各种手势的方法
-(void)pan:(UIPanGestureRecognizer *)pan{
    
    // 边界判断:
    CGFloat topMarginOfImgButton = self.topImageView.frame.origin.y;
    
    CGFloat leftMarginOfImgButton = self.topImageView.frame.origin.x;
    
    CGFloat bottomMarginOfImgButton = self.view.frame.size.height - topMarginOfImgButton - self.topImageView.frame.size.height - 49;
    
    CGFloat rightMarginOfImgButton = self.view.frame.size.width - leftMarginOfImgButton - self.topImageView.frame.size.width;
    
    CGPoint translateP = [pan translationInView:self.topImageView];

    if(topMarginOfImgButton  < 0 ){
    
       self.topImageView.transform = CGAffineTransformTranslate(self.topImageView.transform, translateP.x, 0);
        //必须的重新的赋值控件的frame
        CGRect frame = self.topImageView.frame;
        frame.origin.y = 0;
        self.topImageView.frame = frame;
        
        [pan setTranslation:CGPointZero inView:self.topImageView];
        [self.view layoutIfNeeded];
//        [self viewDidLayoutSubviews];

        return;
        
    }else if ((leftMarginOfImgButton ) < 0){
        
        self.topImageView.transform = CGAffineTransformTranslate(self.topImageView.transform, 0, translateP.y);
        
        //必须的重新的赋值控件的frame
        CGRect frame = self.topImageView.frame;
        frame.origin.x = 0;
        self.topImageView.frame = frame;

        [pan setTranslation:CGPointZero inView:self.topImageView];
        [self.view layoutIfNeeded];
//        [self viewDidLayoutSubviews];

        return;

    }else if ((bottomMarginOfImgButton  ) < 0){
        
        self.topImageView.transform = CGAffineTransformTranslate(self.topImageView.transform, translateP.x, self.view.bounds.size.height - 49 - 50);
        //必须的重新的赋值控件的frame
        CGRect frame = self.topImageView.frame;
        frame.origin.y = self.view.bounds.size.height - 49 - 50;
//        NSLog(@"frame.origin.y == %f", frame.origin.y);
        self.topImageView.frame = frame;
        
        [pan setTranslation:CGPointZero inView:self.topImageView];
        [self.view layoutIfNeeded];
        return;
        
    }else if((rightMarginOfImgButton ) < 0){
        
        self.topImageView.transform = CGAffineTransformTranslate(self.topImageView.transform, self.view.bounds.size.width - 50, translateP.y);
        
        //必须的重新的赋值控件的frame
        CGRect frame = self.topImageView.frame;
        frame.origin.x = self.view.bounds.size.width - 50;
//        NSLog(@"frame.origin.x == %f", frame.origin.x);
        self.topImageView.frame = frame;
        
        [pan setTranslation:CGPointZero inView:self.topImageView];
        [self.view layoutIfNeeded];
        return;

    }
    
    self.topImageView.transform = CGAffineTransformTranslate(self.topImageView.transform, translateP.x, translateP.y);
    [pan setTranslation:CGPointZero inView:self.topImageView];
    [self.view layoutIfNeeded];
    
}

-(void)tap:(UITapGestureRecognizer *)tap{

    self.categoryView.hidden = !self.categoryView.hidden;

}

#pragma mark - navViewButton点击实现的方法
- (IBAction)leftNavBarButtonClick:(UIButton *)sender {
     self.categoryView.hidden = !self.categoryView.hidden;
}


#pragma mark - categoryBtn执行的代理方法
-(void)categoryView:(YQCategoryView *)categoryV didClickButton:(NSUInteger) from{
    //弹窗播放对应的视频窗口!
    switch (from) {
        case 0:{
            self.categoryView.hidden = !self.categoryView.hidden;
            break;
        }
            
            
        default:
            break;
    }
    
    

}


#pragma mark - 内存警告的代理方法

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}




@end
