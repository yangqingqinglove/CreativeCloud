//
//  YQCategoryView.h
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import <UIKit/UIKit.h>

@class YQCategoryView;

@protocol YQCatergoryBtnClickDelegate <NSObject>

// 执行代理的执行的方法
-(void)categoryView:(YQCategoryView *)categoryV didClickButton:(NSUInteger) from;

@end

@interface YQCategoryView : UIView

//提供创建的 类方法
+(instancetype)CategoryViewMenu;

//创建代理
@property(nonatomic,weak)id<YQCatergoryBtnClickDelegate>  delegate;


@end
