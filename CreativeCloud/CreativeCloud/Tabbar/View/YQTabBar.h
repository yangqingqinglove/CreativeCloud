//
//  YQTabBar.h
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/11.
//
//

#import <UIKit/UIKit.h>

@class YQTabBar;

@protocol YQTabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickPlusButton:(YQTabBar *)tabBar ;

@end

@interface YQTabBar : UITabBar

@property (nonatomic, strong) UIButton *plusBtn;
@property (nonatomic, strong) UILabel *plusLabel;

@property (nonatomic, weak) id <YQTabBarDelegate> tabBarDelegate;

@end
