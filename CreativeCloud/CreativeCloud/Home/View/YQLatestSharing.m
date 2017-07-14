//
//  YQLatestSharing.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQLatestSharing.h"

@implementation YQLatestSharing

+(instancetype)latestSharingMenu{

    return [[[NSBundle mainBundle]loadNibNamed:@"YQLatestSharing" owner:nil options:nil] lastObject];
}

@end
