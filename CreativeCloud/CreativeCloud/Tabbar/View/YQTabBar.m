//
//  YQTabBar.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/11.
//
//

#import "YQTabBar.h"

@interface YQTabBar ()

@end

@implementation YQTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // 1.添加一个顶部的按钮到tabbar中
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn setImage:[UIImage imageNamed:@"creation_unchecked.png"] forState:UIControlStateNormal];
        // 设置按钮的frame 的值
        CGRect temp = plusBtn.frame;
        temp.size= CGSizeMake(50, 50);
        plusBtn.frame=temp;
        // addTarget 点击传值
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 2.添加底部的label视图
        UILabel * label = [[UILabel alloc]init];
        CGRect temp1 = label.frame;
        temp1.size= CGSizeMake(50, 10);
        label.frame = temp1;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"创作";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor= [UIColor grayColor];
        
        [self addSubview:plusBtn];
        [self addSubview:label];
        self.plusBtn = plusBtn;
        self.plusLabel = label;
        
    }
    
    return self;
}

- (void)plusClick
{
    
    // 通知代理
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickPlusButton:self];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnx = 0;
    CGFloat btny = 0;
    //5.0是tabbar中的控件的数量
    CGFloat width = self.bounds.size.width/3;
    CGFloat height = self.bounds.size.height;
    
    int i=0;
    
    for (UIView *btn in self.subviews) {
        //判断是否是系统自带的UITabBarButton类型的控件
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i==1) {
                i=2;
            }
            
            btnx = i*width;
            btn.frame = CGRectMake(btnx, btny, width, height);
            
            i++;
        }
        
    }
    
    //设置自定义button的位置
    CGPoint temp = self.plusBtn.center;
    temp.x=self.frame.size.width/2;
    temp.y=self.frame.size.height/2 - 15;
    self.plusBtn.center=temp;

    CGPoint temp1 = self.plusLabel.center;
    temp1.x=self.frame.size.width/2;
    temp1.y=self.frame.size.height/2 + 17;
    self.plusLabel.center =temp1;
    
    
}


@end
