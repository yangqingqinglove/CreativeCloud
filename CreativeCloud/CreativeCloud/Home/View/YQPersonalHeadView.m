//
//  YQPersonalHeadView.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQPersonalHeadView.h"

@implementation YQPersonalHeadView

+(instancetype)personalHeadMenu{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"YQPersonalHead" owner:nil options:nil] lastObject];
}

@end
