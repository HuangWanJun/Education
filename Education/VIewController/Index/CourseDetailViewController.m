//
//  CourseDetailViewController.m
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "CourseViewModel.h"
#import "CourseCell.h"
#import "DetailCourseCell.h"
#import "OneLblCell.h"
#import "CourseType.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface CourseDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) CourseViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *courseList;

@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initalized];
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initalized{
    
    _viewModel= [CourseViewModel new];
    _viewModel.courseId = self.courseId;
    
     [self.tableView registerNib:[UINib nibWithNibName:@"CourseCell" bundle:nil] forCellReuseIdentifier:@"CourseCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OneLblCell" bundle:nil] forCellReuseIdentifier:@"OneLblCell"];
    self.tableView.tableFooterView = [UIView new];
}

-(void)bindViewModel{

    //@strongify(self);
    [_viewModel.getCourseDetail subscribeNext:^(NSArray *arr) {
        //@weakify(self);
        if (arr.count==0)return ;
        self.courseList = arr;
        [_tableView reloadData];
    }];
}

#pragma mark - tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_courseList.count >0 )
        return 5;
    else return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count;
    switch (indexPath.section) {
        case 0: count = 88; break;
        case 1: count = 100; break;
        default:{
            NSString *txt ;
            NSDictionary *info = _courseList[0];
            CourseType *item = [CourseType mj_objectWithKeyValues:info];
            if (indexPath.section == 2) { txt =  item.CourseValue;}
            if (indexPath.section == 3) { txt =  item.TeacherSummary;}
            if (indexPath.section == 4) { txt =  item.CourseOutline;}

             Class currentClass = [OneLblCell class];
             CGFloat width = [UIScreen mainScreen].bounds.size.width;
            
            count =  [self.tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"oneTxt" cellClass:currentClass contentViewWidth:width];
            
        }
        break;
    }
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 30 ;
}

-(UITableViewCell*)tableView:(UITableView *)tableVIEW cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *info = _courseList[indexPath.row];
     CourseType *item = [CourseType mj_objectWithKeyValues:info];
    if (indexPath.section == 0) {
        CourseCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"CourseCell"];
        cell.nav = self.navigationController;
        [cell config:info];
        return cell;
    }else if(indexPath.section == 1){
        DetailCourseCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"detailcell"];
        cell.oneLbl.text = [NSString stringWithFormat:@"上课地点：%@",item.CoursePlace];
        cell.twoLbl.text = [NSString stringWithFormat:@"上课时间：%@",item.CourseOpenDate];
        cell.threeLbl.text = [NSString stringWithFormat:@"邀请人数：%@",item.PinFocusStu];
        cell.fourLbl.text = [NSString stringWithFormat:@"开课人数：%@",item.PinMemberNum];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else{
        NSString *txt ;
        if (indexPath.section == 2) { txt =  item.CourseValue;}
        if (indexPath.section == 3) { txt =  item.TeacherSummary;}
        if (indexPath.section == 4) { txt =  item.CourseOutline;}
        OneLblCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"OneLblCell"];
        cell.oneTxt = txt;
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section > 0) {
    UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
    headView.backgroundColor = RGCOLOR(237, 240, 241);
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
    if (section == 1) titleLbl.text = @"課程信息";
    else if(section == 2) titleLbl.text = @"課程收益";
    else if(section == 2) titleLbl.text = @"讲师导读";
    else titleLbl.text = @"课程大纲";
    titleLbl.font = [UIFont systemFontOfSize:16];
    [headView addSubview:titleLbl];
    return headView ;
    }
    return nil;
}


#pragma mark - action

- (IBAction)backEvent:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
