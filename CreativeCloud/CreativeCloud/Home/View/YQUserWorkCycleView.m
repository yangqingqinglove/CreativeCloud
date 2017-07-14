//
//  YQUserWorkCycleView.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/14.
//
//

#import "YQUserWorkCycleView.h"
#import "SDCycleScrollView.h"

@interface YQUserWorkCycleView ()<SDCycleScrollViewDelegate>

@end

@implementation YQUserWorkCycleView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super initWithCoder:aDecoder]){
        NSArray *imageNames = @[@"banner_Circle_of_friends.png",
                                @"banner_recommend.png",
                                @"banner_share.png",
                                @"center_banner1.png",
                                // 本地图片请填写全名
                                // 网络图片是填写url
                                ];
        
        SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"banner_Circle_of_friends.png"]];
        
        cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView2.localizationImageNamesGroup = imageNames;
        
        cycleScrollView2.currentPageDotImage = [UIImage imageNamed:@"client_click"]; // 自定义分页控件小圆标颜色
        cycleScrollView2.pageDotImage = [UIImage imageNamed:@"client"];
        // cycleScrollView.delegate = ; // 如需监听图片点击，请设置代理，实现代理方法
        cycleScrollView2.autoScrollTimeInterval = 6.0;
        
        [self addSubview:cycleScrollView2];

    }
    
    return self;
}



@end
