//
//  LessonView.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "LessonView.h"
#import "LessonCollectionCell.h"

@interface LessonView()

@property(nonatomic,copy)NSArray *arry;


@end

@implementation LessonView



-(instancetype)init{
    
    if (self = [super init])
    {
        self.backgroundColor=[UIColor orangeColor];
        
    }
 
    
    return self;
}

-(void)initData{
    
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    
   
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.backgroundColor=[UIColor orangeColor];
    // UINib *nib = [UINib nibWithNibName:@"LessonCollectionCell" bundle:nil];
    // [self.collectionView  registerNib:nib forCellWithReuseIdentifier:@"LessonCollectionCell"];
    [self.collectionView  registerClass:[LessonCollectionCell class]forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self addSubview:self.collectionView];
    
  //  self.arry = @[@"古董欣赏",@"字画欣赏",@"银币书法",@"英语语法",@"篮球",@"古董欣赏",@"字画欣赏",@"银币书法",@"英语语法",@"篮球",@"古董欣赏",@"字画欣赏",@"银币书法",@"英语语法",@"篮球",@"古董欣赏",@"字画欣赏",@"银币书法",@"英语语法",@"篮球",@"古董欣赏",@"字画欣赏",@"银币书法",@"英语语法",@"篮球"];
    if (self.number==1) {
        self.arry =@[@"4D领导力提升组织绩效 主讲：邓臻老师",@"情境领导力 主讲：李伟老师",@"变革领 主讲：王文浩老师",@"向孔子学领导力 主讲：刘澜老师",@"创新领导力 主讲：许正老师",@"无忧咨询顾问——人力资源成长专家",@"案例教学法 —企业培训师的必备技能",@"任旭峰老师"];

    }
    else
        self.arry =@[@"情压管理 主讲：胡鹏飞教师",@"如何玩转PPT 主讲：杨弘宇老师",@"向乔布斯学演讲 主讲：杨天颖老师",@"高效商务写作 主讲：戴愫老师",@"九型人格与高效沟通 主讲：黄德生老师",@"无忧咨询顾问——人力资源成长专家",@"ＭＴＰ —中层管理人员必修课",@"严明老师",];




    
    [self layoutUI];
}

#pragma mark collectionview

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.arry count];
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify=@"cell";
    //    UICollectionViewCell *cell=[[UICollectionViewCell alloc] init];
    LessonCollectionCell *cell = (LessonCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    [cell sizeToFit];
    cell.backgroundColor=[UIColor whiteColor];
    cell.lessonNameLbl.text=self.arry[indexPath.row];
    return cell;
}
//UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect rect=  collectionView.frame;
    return CGSizeMake(( rect.size.width-20)/2, 100);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
   // NSDictionary* serInfo =  [_curServerArr objectAtIndex:indexPath.row];
 
    
}

#pragma mark - private method
-(void)layoutUI{

    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self);
    }];
    
}


@end
