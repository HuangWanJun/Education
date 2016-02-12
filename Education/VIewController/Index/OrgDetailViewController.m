//
//  OrgDetailViewController.m
//  Education
//
//  Created by Samuelhuang on 12/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "OrgDetailViewController.h"
#import "OrgViewModel.h"
#import "OrgCell.h"
#import "OneLblCell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"



@interface OrgDetailViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)OrgViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *orgArr;

@end

@implementation OrgDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
    [self initalize];
}

-(void)buildUI{
    [self.tableView registerNib:[UINib nibWithNibName:@"OrgCell" bundle:nil] forCellReuseIdentifier:@"OrgCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OneLblCell" bundle:nil] forCellReuseIdentifier:@"OneLblCell"];
    self.tableView.tableFooterView = [UIView new];
}

-(void)initalize{

    self.viewModel = [OrgViewModel new];
    self.viewModel.orgId = self.orgInfo[@"CourseID"];
    [self.viewModel.getOrgDetail subscribeNext:^(NSArray* arr) {
        _orgArr = arr;
        [_tableView reloadData];
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_orgArr.count == 0) {
        return 0;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count;
    switch (indexPath.section) {
        case 0: count = 112; break;
        default:{
            NSString *txt ;
            NSDictionary *info = self.orgArr[0];
            if (indexPath.section == 1) { txt = info[@"OrgDetail"];}
            Class currentClass = [OneLblCell class];
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            
            count =  [self.tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"oneTxt" cellClass:currentClass contentViewWidth:width];
        }
            break;
    }
    return count;
}

-(UITableViewCell*)tableView:(UITableView *)tableVIEW cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *info = self.orgArr[0];
    if (indexPath.section == 0) {
        OrgCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"OrgCell"];
        [cell configOrg:info];
        return cell;
    }else if(indexPath.section > 0){
        
        NSString *txt ;
        if (indexPath.section == 1) { txt = info[@"OrgDetail"];}
        OneLblCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"OneLblCell"];
        cell.oneTxt = txt;
        return cell;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 30 ;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section > 0) {
        UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
        headView.backgroundColor = RGCOLOR(237, 240, 241);
        UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 200, 20)];
        if (section == 1) titleLbl.text = @"介紹";
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
