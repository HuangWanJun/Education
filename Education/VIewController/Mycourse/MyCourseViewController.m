//
//  MyCourseViewController.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "MyCourseViewController.h"
#import "LoginViewController.h"
#import "OrderViewModel.h"
#import "CourseCell.h"

@interface MyCourseViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)OrderViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray *courseList;
@end

@implementation MyCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [OrderViewModel new];
    [self.tableView registerNib:[UINib nibWithNibName:@"CourseCell" bundle:nil] forCellReuseIdentifier:@"CourseCell"];

    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadData{

    
    [_viewModel.getOrderSignal subscribeNext:^(NSArray *arr) {
        self.courseList =arr;
        [self.tableView reloadData];
    }];
}

#pragma mark - tableView


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.courseList count];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88;
}

-(UITableViewCell*)tableView:(UITableView *)tableVIEW cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"CourseCell"];
    NSDictionary *info = self.courseList[indexPath.row];
    [cell config:info];
    return cell;
}

-(void)tableView:(UITableView *)TableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [TableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
