//
//  ProfileViewController.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "ProfileViewController.h"
#import "LoginCell.h"
#import "ItemCell.h"

@interface ProfileViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSString *userName;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = BgColor;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *info =  [Global unArchiverData:K_USERINFO];
    if (info) {
        self.userName = [info[@"uid"] description];
    }else{
        self.userName  = @"立即登录";
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1  || section == 3 ) {
        return 1;
    }
   else  return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return  93;
    }
    else return 51;
}

-(UITableViewCell*)tableView:(UITableView *)tableVIEW cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if (indexPath.section == 0 ) {
         LoginCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"loginCell"];
        [cell config:@{@"UserName":self.userName}];
        return cell;
    }
    else{
        ItemCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"itemCell"];
        if (indexPath.section == 1) {
            [cell config:@{@"img":@"time",@"title":@"我的订单"}];
        }else if (indexPath.section == 2) {
            [cell config:@{@"img":@"myCourse",@"title":@"我的课程"}];
        }else if (indexPath.section == 2 && indexPath.row == 0) {
            [cell config:@{@"img":@"messageTab",@"title":@"我的收藏"}];
        }
        else if (indexPath.section == 2  && indexPath.row == 1) {
            [cell config:@{@"img":@"seach",@"title":@"我的学分"}];
        }
        else if (indexPath.section == 3) {
            [cell config:@{@"img":@"person",@"title":@"设置"}];
        }
        
        return cell;
    }
}

-(void)tableView:(UITableView *)TableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [TableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}

-(IBAction)loginEvent:(UIStoryboardSegue *)segue{
    
}


@end
