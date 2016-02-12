//
//  HomeViewController.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "HomeViewController.h"
#import "PointCell.h"
#import "TeacherCellTableViewCell.h"
#import "LessonViewController.h"
#import "HomeLessonCell.h"
#import "HomeViewModel.h"
#import "TAPageControl.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,TAPageControlDelegate>


@property(nonatomic,strong)NSArray *introduceArr;
@property(nonatomic,strong)NSArray *teacherArr;
@property(nonatomic,strong)NSArray *lessonArr;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UINavigationBar* navBar;
@property(nonatomic,strong)UIImageView* headView;
@property(nonatomic,strong)UIScrollView *scrollView;


@property(nonatomic,strong)HomeViewModel *viewModel;
@property (strong, nonatomic) TAPageControl *customPageControl2;

@end

@implementation HomeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];

    [self autoLayout];
    [self BindingViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    
}


#pragma mark tableView delegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0) return 0;
    else if(section==1) return 0;
    else  return 20;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(section==0) return nil;
    else if (section==1) {
    
        UIView* headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_BOUNDS_WIDTH, 44)];
        UITextField* textField = [UITextField new ];
        textField.placeholder=@"搜索";
        [headView addSubview:textField];
        [self layoutHeadView:headView textField:textField];
        return nil;
        //return headView;
    }
    else if(section==2){
        UIView* headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_BOUNDS_WIDTH,20)];
        UILabel* textLbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 10)];
        textLbl.text= @"热门课程";
        [headView addSubview:textLbl];
        return headView;
    }
    else if(section==3){
        UIView* headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SCREEN_BOUNDS_WIDTH,20)];
        UILabel* textLbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, 10)];
        textLbl.text= @"推荐教师";
        [headView addSubview:textLbl];
        return headView;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)  return 1;
    else if(section==1) return 1;
    else if(section==2)
        return [self.lessonArr count];
    else return  [self.teacherArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)  return 100;
    else if(indexPath.section==1) return 140;
    else return 60;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
    
    if(indexPath.section==0){
    
        UITableViewCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"adCell"];
        if(cell==nil){
        
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adCell"];
            self.scrollView=[UIScrollView new];
            self.scrollView.delegate =self;
            [cell.contentView addSubview:self.scrollView];
            
            [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(cell.contentView);
            }];
            self.scrollView.contentSize=CGSizeMake(4*SCREEN_VIEW_WIDTH, 50);
            self.scrollView.pagingEnabled=YES;
            self.scrollView.tag = 13;
            for (int i=0; i<4; i++) {
                UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*SCREEN_VIEW_WIDTH, 0, SCREEN_VIEW_WIDTH, 100)];
                imageView.image=[UIImage imageNamed:@"menu_background"];
                [self.scrollView addSubview:imageView];
            }
            
           self.customPageControl2  = [[TAPageControl alloc] initWithFrame:CGRectMake(0, 70 , SCREEN_VIEW_WIDTH, 20)];
            self.customPageControl2.delegate    = self;
            self.customPageControl2.numberOfPages =  4;
            self.customPageControl2.currentPage = 0;
            self.customPageControl2.dotImage        = [UIImage imageNamed:@"dotInactive"];
            self.customPageControl2.currentDotImage = [UIImage imageNamed:@"dotActive"];
            [cell.contentView addSubview:self.customPageControl2];

        }
        
        return cell;
    }
    else if(indexPath.section==1){
   
            PointCell* cell = [tableView dequeueReusableCellWithIdentifier:@"pointCell"];
            if(cell==nil){
                cell  = [[PointCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pointCell"];
                [[cell.btn1 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                    [self navToLessonVC:1];
                }];
                [[cell.btn2 rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                    [self navToLessonVC:0];
                }];
            }
        
             return cell;
    }
    else if(indexPath.section==2){
        HomeLessonCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"HomeLessonCell"];
        
        if(cell==nil){
            cell=[[HomeLessonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeLessonCell"];
         }
        NSDictionary *info = self.lessonArr[indexPath.row];
        cell.titleLbl.text= info[@"CourseName"];
        cell.descLbl.text= info[@"TeacherName"];
        cell.logoImage.image = [UIImage imageNamed:@"ic_1"];
        
        return cell;

        
       }
    else{
        TeacherCellTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"teaCell"];
        if(cell==nil){
            cell = [[TeacherCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"teaCell"];
        }
        NSDictionary *info = self.teacherArr[indexPath.row];
        cell.teachImageView.image = [UIImage imageNamed:@"ic_7"];
        cell.teacherLabel.text =info[@"TeacherName"];
        cell.introduceLabel.text = info[@"TeacherDetail"];
        
        return cell;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - ScrollView delegate



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.tag != 13) {
        return;
    }
    NSInteger pageIndex = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    self.customPageControl2.currentPage = pageIndex;
}


#pragma mark - private methods

-(void)initData{
    

    self.viewModel = [HomeViewModel new];
    self.introduceArr= @[@"九型人格与识人用人",@"如何做一场精彩的TED演讲",@"4D领导力提升团队绩效",@"无忧顾问公司",@"无忧顾问公司",];
    //self.teacherArr = @[@"讲师：黄德生老师",@"讲师：戴晓雪老师",@"讲师：邓臻老师",@"胡鹏飞老师",@"胡鹏飞老师",];
}

-(void)autoLayout{
    
    self.navigationController.navigationBar.hidden=YES;
    
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    self.navBar = [UINavigationBar new];
    
    __weak __typeof(&*self)weaksSelf = self;
    
    
    //headview
   // self.headView.image=[UIImage imageNamed:@"menu_background"];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weaksSelf.view.mas_top);
        make.left.equalTo(weaksSelf.view.mas_left);
        make.right.equalTo(weaksSelf.view.mas_right);
        make.bottom.equalTo(weaksSelf.view.mas_bottom);

    }];
    
}

-(void)navToLessonVC:(NSInteger)number{
    
    LessonViewController *lessVC=[[LessonViewController alloc]initWithNibName:@"LessonViewController" bundle:nil];
    lessVC.hidesBottomBarWhenPushed=YES;
    lessVC.number=number;
    [self.navigationController pushViewController:lessVC animated:YES];
}



-(void)layoutHeadView:(UIView *)headView textField:(UITextField *)textField{
    
    headView.backgroundColor=[UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    UIEdgeInsets padding = UIEdgeInsetsMake(15, 15, 15, 15);
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(headView).insets(padding);
    }];
}

-(void)BindingViewModel{

    [self.viewModel.getListCourse subscribeNext:^(NSArray *couresArr) {
        self.lessonArr = couresArr;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationBottom];
       // [self.tableView reloadData];
    }];
    
    [self.viewModel.getListTeacher subscribeNext:^(NSArray *couresArr) {
        self.teacherArr = couresArr;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationBottom];
    }];

    
}


@end
