//
//  YQPersonalTableViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/12.
//
//

#import "YQPersonalTableViewController.h"

@interface YQPersonalTableViewController ()<UITableViewDelegate>

@end

static NSString * ID = @"cell";

@implementation YQPersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 注册 原型cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"个人"];
    
    return cell;
}


#pragma mark - TableView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // any offset did change
    self.contentoffSets = scrollView.contentOffset.y;
    
}

-(void)setContentoffSets:(CGFloat)contentoffSets{
    
    _contentoffSets = contentoffSets;
    
    if(contentoffSets > 0 && contentoffSets < 100){
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"YQContentoffSetsNoties" object:nil userInfo:@{@"ContentoffSets":@(contentoffSets)}];
        
    }
    
   
}







@end
