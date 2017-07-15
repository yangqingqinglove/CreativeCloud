//
//  YQUserWorks.h
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/13.
//
//

#import <UIKit/UIKit.h>
#import "YQUserWorkCycleView.h"

@interface YQUserWorks : UIView


@property (weak, nonatomic) IBOutlet YQUserWorkCycleView *cycleView;


+(instancetype)userWorksMenu;


@end
