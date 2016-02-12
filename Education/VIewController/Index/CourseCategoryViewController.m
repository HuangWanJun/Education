//
//  CourseCategoryViewController.m
//  Education
//
//  Created by Samuelhuang on 5/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "CourseCategoryViewController.h"
#import "HomeViewModel.h"
#import "CourseViewModel.h"
#import "ZKSegment.h"
#import "CourseCell.h"
#import "CourseDetailViewController.h"

@interface CourseCategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet ZKSegment *zkSegment;
@property (nonatomic,assign)ZKSegmentStyle zkSegmentStyle;
@property (nonatomic,strong) NSArray *smallTitleArr;
@property(nonatomic,strong) NSMutableArray *courseList;
@property(nonatomic,strong)HomeViewModel *homeViewModel;
@property(nonatomic,strong)CourseViewModel *viewModel;
@end

@implementation CourseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
}

//MARK : private methods
-(void)initData{
    self.homeViewModel = [HomeViewModel new];
    self.viewModel = [CourseViewModel new];
    [self.tableView registerNib:[UINib nibWithNibName:@"CourseCell" bundle:nil] forCellReuseIdentifier:@"CourseCell"];
    self.zkSegmentStyle = ZKSegmentRectangleStyle;
    
    [self getCourseList];
    [self getSmallScoureTitle];
   
}

-(void)buildZkSegment{
  
    for (NSInteger i=self.zkSegment.zk_items.count; i >= 0; i--) {
        [self.zkSegment zk_removeItemAtIndex:i];
    }
    
    for (NSInteger i=0; i< self.smallTitleArr.count; i++) {
        NSDictionary *info = self.smallTitleArr[i];
        [self.zkSegment zk_addItem:info[@"name"]];
    }
    if (self.smallTitleArr.count>0) {
         [self.zkSegment zk_itemClickByIndex:0];
    }
   
   
}

-(void)getSmallScoureTitle{

    @weakify(self);
    self.viewModel.bigCourseId = self.info[@"cid"];
    [SVProgressHUD show];
    [self.viewModel.getCurseType subscribeNext:^(NSArray *arr) {
        @strongify(self);
        self.smallTitleArr = arr;
        [self buildZkSegment];
        [SVProgressHUD dismiss];
    }];

}

-(void)getCourseList{
 
    @weakify(self);
    self.zkSegment.zk_itemClickBlock = ^(NSString *itemName , NSInteger itemIndex){
        //加载小类 课程
        if (self.smallTitleArr.count>itemIndex) {
            NSString *smallId = self.smallTitleArr[itemIndex][@"cid"];
            self.homeViewModel.smallCourseId = smallId;
            [self.homeViewModel.getListCourse subscribeNext:^(NSArray *couresArr) {
                @strongify(self);
                self.courseList = [couresArr mutableCopy];
                [self.tableView reloadData];
            }];
        }
        else{NSLog(@"超過越界");}
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//MARK  - collectview delegate

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
    self.info = self.titleArr[indexPath.row];
    [self getSmallScoureTitle];
    
}

#pragma mark - tableView


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.courseList.count;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *info = self.courseList[indexPath.row];
    CourseDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"CourseDetailViewController"];;
    vc.courseId = info[@"CourseID"];
    [self.navigationController pushViewController:vc animated:YES];
}

//MARK: back

-(IBAction)backEven:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
