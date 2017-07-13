//
//  YQCategoryView.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQCategoryView.h"

@interface YQCategoryView ()


@end


@implementation YQCategoryView

+(instancetype)CategoryViewMenu{

    return [[[NSBundle mainBundle]loadNibNamed:@"YQCategory" owner:nil options:nil] lastObject];

}

#pragma mark - 各个按钮执行的点击方法
// 删除
- (IBAction)deleteBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }
    
}


// 生日
- (IBAction)birthdayBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 简历
- (IBAction)resumeBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 青春
- (IBAction)youthBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 爱情
- (IBAction)loveBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 节日
- (IBAction)festivalBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 时光
- (IBAction)timeBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// 家庭
- (IBAction)familyBtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

}

// h5 
- (IBAction)H5BtnClick:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(categoryView:didClickButton:)]){
        
        [self.delegate categoryView:self didClickButton:sender.tag];
    }

    
    
}

@end
