//
//  YQHotRecommendation.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQHotRecommendation.h"

@implementation YQHotRecommendation

+(instancetype)hotRecommendationMenu{

    return [[[NSBundle mainBundle]loadNibNamed:@"YQHotRecommentdation" owner:nil options:nil] lastObject];
}

@end
