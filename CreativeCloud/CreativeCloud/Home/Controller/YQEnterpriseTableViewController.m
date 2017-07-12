//
//  YQEnterpriseTableViewController.m
//  CreativeCloud
//
//  Created by 杨庆 on 2017/7/12.
//
//

#import "YQEnterpriseTableViewController.h"

@interface YQEnterpriseTableViewController ()

@end

static NSString * ID = @"enterpriseCell";


@implementation YQEnterpriseTableViewController

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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"企业"];
    return cell;
    
}

#pragma mark - TableView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // any offset did change
//    NSLog(@"scrollView.y == %f",scrollView.contentOffset.y);
    
    CGFloat contentoffSets = scrollView.contentOffset.y;
    
    if(contentoffSets > 0 && contentoffSets < 100){
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"YQContentoffSetsNoties" object:nil userInfo:@{@"ContentoffSets":@(contentoffSets)}];
        
    }
    
}


@end
