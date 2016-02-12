//
//  LessonViewController.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "LessonViewController.h"
#import "LessonView.h"

@interface LessonViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UINavigationBar* navBar;
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* leftArray;
@property(nonatomic,strong)LessonView* lessonView;
@end

@implementation LessonViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.navBar = [UINavigationBar new];
    [self.view addSubview:self.navBar];
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.lessonView = [LessonView new];
    self.lessonView.number= self.number;
    [self.view addSubview:self.lessonView];
   
    [self initData];
    [self autoLayout];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

#pragma mark tableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.leftArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 44;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.backgroundColor=[UIColor lightGrayColor];
    cell.textLabel.text= self.leftArray[indexPath.row];
    
    return cell;
}

#pragma mark - private methods

-(void)autoLayout{
    
    
    __weak __typeof(&*self)weaksSelf = self;
 
     //navBar
     UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:nil];
     item.title=@"MBA";
     [self.navBar pushNavigationItem:item animated:NO];
     self.navBar.tag=99;
     [self.navBar mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(weaksSelf.view.mas_top);
     make.left.equalTo(weaksSelf.view.mas_left);
     make.right.equalTo(weaksSelf.view.mas_right);
     make.height.equalTo(@64);
     }];
     self.navBar.barTintColor= [UIColor greenColor];
     // self.navBar.tintColor = [UIColor redColor];
  
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weaksSelf.navBar.mas_bottom);
        make.left.equalTo(weaksSelf.view.mas_left);
        make.width.equalTo(@120);
        make.bottom.equalTo(weaksSelf.view.mas_bottom);
        
    }];
    
    [self.lessonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weaksSelf.navBar.mas_bottom);
        make.left.equalTo(weaksSelf.tableView.mas_right);
        make.right.equalTo(weaksSelf.view.mas_right);
        make.bottom.equalTo(weaksSelf.view.mas_bottom);
    }];
    
}

-(void)initData{
    if (self.number==1) {
         self.leftArray = @[@"领导力",];
    }else
        self.leftArray = @[@"职业素养",];
    //self.leftArray = @[@"舞蹈",@"绘画",@"书法",@"雕塑",@"欣赏",@"戏剧",@"运动",@"武术",@"棋牌",@"歌剧",];
    [self.lessonView initData];
}


@end
