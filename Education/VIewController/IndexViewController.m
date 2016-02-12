//
//  IndexViewController.m
//  Education
//
//  Created by Samuelhuang on 21/10/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "IndexViewController.h"
#import "CourseCategoryViewController.h"
#import "OrgDetailViewController.h"
#import "HomeViewModel.h"
#import "IndexCell.h"
#import "CourseCell.h"
#import "OrgCell.h"
#import "MyScrollView.h"
#import "CourseDetailViewController.h"
#import "TeacherViewController.h"
#import "OrgDetailViewController.h"


@interface IndexViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *titleArr;

@property (weak, nonatomic) IBOutlet MyScrollView *myScrollview;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)HomeViewModel *viewModel;
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,strong)NSArray *courseList;
@property(nonatomic,strong)NSArray *teacherList;
@property(nonatomic,strong)NSArray *orgList;
@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationController.navigationBar.hidden = YES;
    [self initData];
    [self BindingViewModel];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

#pragma mark - private methods

-(void)initData{
    self.viewModel = [HomeViewModel new];
    [self.tableView registerNib:[UINib nibWithNibName:@"CourseCell" bundle:nil] forCellReuseIdentifier:@"CourseCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrgCell" bundle:nil] forCellReuseIdentifier:@"OrgCell"];
    
    [self.myScrollview receiveObject:^(NSDictionary *info) {
        //NextType=1是课程详情页  2 是教师详情页 3是机构详情页
        
    }];
    
}

-(void)BindingViewModel{
    
    @weakify(self);
    
    //ad
    [self.viewModel.getAd subscribeNext:^(NSArray *imageArr) {
        @strongify(self);
        self.imageArr = imageArr;
        [self.myScrollview prepareScollView:self.imageArr];
    }];
    
    //分類導航
    [self.viewModel.getCourseCategory subscribeNext:^(NSArray *couresArr) {
        @strongify(self);
        self.titleArr = couresArr;
        [self.collectionView reloadData];
    }];
    
    //熱門課程
    [self.viewModel.getListCourse subscribeNext:^(NSArray *couresArr) {
        @strongify(self);
        self.courseList = couresArr;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        // [self.tableView reloadData];
    }];
    
    //名師推薦
    [self.viewModel.getListTeacher subscribeNext:^(NSArray *couresArr) {
        @strongify(self);
        self.teacherList = couresArr;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    //机构推荐
    [self.viewModel.getListOrg subscribeNext:^(NSArray *couresArr) {
        @strongify(self);
        self.orgList = couresArr;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    }];
}

#pragma mark - collectview delegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  [_titleArr count];
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"collectCell";
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UIImageView* imageV =(UIImageView*)  [cell viewWithTag:11];
    imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"ic_%ld",indexPath.row+1]];
    
    UILabel* titleLbl =(UILabel*)  [cell viewWithTag:12];
    NSDictionary *info = _titleArr[indexPath.row];
    titleLbl.text = info[@"name"];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = SCREEN_VIEW_WIDTH / 4 ;
    return CGSizeMake(height, 80);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

#pragma mark - tableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count;
    switch (section) {
        case 0: count = [self.courseList count]; break;
        case 1: count = [self.teacherList count]; break;
        case 2: count = [self.orgList count]; break;
        default:
            break;
    }
    return count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger count;
    switch (indexPath.section) {
        case 0: count = 88; break;
        case 1: count = 112; break;
        case 2: count = 112; break;
        default:
            break;
    }
    return count;
}

-(UITableViewCell*)tableView:(UITableView *)tableVIEW cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //課程
        CourseCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"CourseCell"];
        NSDictionary *info = self.courseList[indexPath.row];
        [cell config:info];
        
        return cell;
    }
    else if (indexPath.section == 1) {
        //猜你喜欢
        OrgCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"OrgCell"];
        NSDictionary *info = self.teacherList[indexPath.row];
        [cell config:info];
        return cell;
    }
    else{
        //機構推薦
        OrgCell *cell = [tableVIEW dequeueReusableCellWithIdentifier:@"OrgCell"];
        NSDictionary *info = self.orgList[indexPath.row];
        [cell config2:info];
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectZero];
    headView.backgroundColor = RGCOLOR(237, 240, 241);
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    if (section == 0) titleLbl.text = @"热门课程";
    else if(section == 1) titleLbl.text = @"猜你喜欢";
    else titleLbl.text = @"机构推荐";
    titleLbl.font = [UIFont systemFontOfSize:16];
    [headView addSubview:titleLbl];
    return headView ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSDictionary *info = self.courseList[indexPath.row];
        CourseDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CourseDetailViewController"];;
        vc.courseId = info[@"CourseID"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.section == 1){
        NSDictionary *info = self.courseList[indexPath.row];
        TeacherViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"TeacherViewController"];;
        vc.info = info;
        [self.navigationController pushViewController:vc animated:YES];

    }else if(indexPath.section == 2){
        NSDictionary *info = self.courseList[indexPath.row];
        OrgDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"OrgDetailViewController"];;
        vc.orgInfo = info;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//MARK: Action
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
    if([segue.identifier isEqualToString:@"showCategory"]){
    
        NSIndexPath* indexPath =  [self.collectionView indexPathForCell:sender];
        NSDictionary *info = _titleArr[indexPath.row];
        CourseCategoryViewController *courseCategory = segue.destinationViewController;
        courseCategory.titleArr = self.titleArr;
        courseCategory.info = info;
    }
    else if([segue.identifier isEqualToString:@"orgDetail"])
    {
        NSIndexPath* indexPath =  [self.tableView indexPathForCell:sender];
        NSDictionary *info = self.orgList[indexPath.row];
        Organization *org =  [Organization mj_objectWithKeyValues:info];
        OrgDetailViewController *vc = segue.destinationViewController;
       // vc.org = org;
    }
    else if([segue.identifier isEqualToString:@"courseDetail"])
    {
        NSIndexPath* indexPath =  [self.tableView indexPathForCell:sender];
        NSDictionary *info = self.courseList[indexPath.row];
        
        CourseDetailViewController *vc = segue.destinationViewController;
        vc.courseId = info[@"CourseID"];
    }
}

@end
