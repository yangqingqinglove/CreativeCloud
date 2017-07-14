//
//  YQUserWorks.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQUserWorks.h"

@implementation YQUserWorks

+(instancetype)userWorksMenu{

    return [[[NSBundle mainBundle]loadNibNamed:@"YQUserWorks" owner:nil options:nil] lastObject];
}

@end
