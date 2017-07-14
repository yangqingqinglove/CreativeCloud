//
//  YQFriendsCreative.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import "YQFriendsCreative.h"

@implementation YQFriendsCreative

+(instancetype)friendsCreativeMenu{

    return [[[NSBundle mainBundle]loadNibNamed:@"YQFriendsCreative" owner:nil options:nil] lastObject];
}

@end
