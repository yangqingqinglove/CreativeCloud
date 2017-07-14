//
//  YQPersonalTableViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/12.
//
//

#define FullScreenWidth [UIScreen mainScreen].bounds.size.width

#import "YQPersonalTableViewController.h"
#import "YQCycleView.h"
#import "YQPersonalHeadView.h"
#import "YQUserWorks.h"
#import "YQLatestSharing.h"
#import "YQFriendsCreative.h"
#import "YQHotRecommendation.h"

@interface YQPersonalTableViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

// 创建的所有的子视图的
@property(nonatomic,strong)YQCycleView * cycleView;

@property(nonatomic,strong)YQPersonalHeadView * personalHV;
@property(nonatomic,strong)YQUserWorks * userWorks;
@property(nonatomic,strong)YQLatestSharing * latestSharing;
@property(nonatomic,strong)YQFriendsCreative * friensCreative;
@property(nonatomic,strong)YQHotRecommendation * hot;

@end


@implementation YQPersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加各种子cell控件
    [self addChildContentView];

}


#pragma mark - 添加各种子控件的方法
-(void)addChildContentView{
    //轮播图
    YQCycleView * cycleV = [[YQCycleView alloc]initWithFrame:CGRectMake(0, 0, FullScreenWidth, 204)];
    [self.contentScrollView addSubview:cycleV];
    
//    [cycleV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentScrollView.mas_top ).offset(0);
//        make.left.equalTo(self.contentScrollView.mas_left ).offset(0);
//        make.right.equalTo(self.contentScrollView.mas_right ).offset(0);
//        make.height.equalTo(@200);
//        
//    }];
    
    self.cycleView = cycleV;
    
    
    //headV
    YQPersonalHeadView * pHead =[YQPersonalHeadView personalHeadMenu];
    pHead.frame = CGRectMake(0, self.cycleView.sd_height - 8, FullScreenWidth, 132);
    [self.contentScrollView addSubview:pHead];
//    [pHead mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentScrollView).offset(0);
//        make.top.equalTo(self.cycleView.mas_bottom).offset(-8);
//        make.height.equalTo(@126);
//
//    }];
    self.personalHV = pHead;
    

    //客户作品
    YQUserWorks * userWorks = [YQUserWorks userWorksMenu];
    userWorks.frame = CGRectMake(0, self.personalHV.sd_y + self.personalHV.sd_height + 5, FullScreenWidth, 191);
    [self.contentScrollView addSubview:userWorks];
//    [userWorks mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentScrollView).offset(0);
//        make.top.equalTo(self.personalHV.mas_bottom).offset(5);
//        make.height.equalTo(@183);
//        
//    }];
    self.userWorks = userWorks;
    

    //最新分享
    YQLatestSharing * latest = [YQLatestSharing latestSharingMenu];
    [self.contentScrollView addSubview:latest];
    latest.frame = CGRectMake(0, self.userWorks.sd_y + self.userWorks.sd_height + 5, FullScreenWidth, 165);
//    [latest mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentScrollView).offset(0);
//        make.top.equalTo(self.userWorks.mas_bottom).offset(5);
//        make.height.equalTo(@159);
//        
//    }];
    self.latestSharing = latest;
    
    
    //朋友圈创意
    YQFriendsCreative * friends = [YQFriendsCreative friendsCreativeMenu];
    friends.frame = CGRectMake(0, self.latestSharing.sd_y + self.latestSharing.sd_height + 5, FullScreenWidth, 215);
    [self.contentScrollView addSubview:friends];
    
//    [friends mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentScrollView).offset(0);
//        make.top.equalTo(self.latestSharing.mas_bottom).offset(5);
//        make.height.equalTo(@207);
//        
//    }];
    self.friensCreative  = friends;
    

    //热门推荐
    YQHotRecommendation * hot = [YQHotRecommendation hotRecommendationMenu];
    // 注意的是 这里的height是有图数据的高度的因素
    hot.frame = CGRectMake(0, self.friensCreative.sd_y + self.friensCreative.sd_width + 5, FullScreenWidth, 20);
    
    [self.contentScrollView addSubview:hot];
//    [hot mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.contentScrollView).offset(0);
//        make.top.equalTo(self.friensCreative.mas_bottom).offset(5);
//        make.height.equalTo(@207);
//        
//    }];
    self.hot = hot;
    
    //设置的是 预估行高
//    CGFloat height = 800;
//    self.contentScrollView.contentSize = CGSizeMake(0, height);
    
    //最后的合成一下,scrollView的contentsize
    CGFloat height = self.hot.sd_height + self.hot.sd_y +10;
    self.contentScrollView.contentSize = CGSizeMake(0, height);

}


#pragma mark - scrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // any offset did change
    self.contentoffSets = scrollView.contentOffset.y;
    
}

-(void)setContentoffSets:(CGFloat)contentoffSets{
    
    _contentoffSets = contentoffSets;
    
    if(contentoffSets > 0 && contentoffSets < 100){
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"YQContentoffSetsNoties" object:nil userInfo:@{@"ContentoffSets":@(contentoffSets)}];
        
    }
    
}


#pragma mark - 内存警告的代理方法
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
