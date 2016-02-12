//
//  MyScrollView.m
//  Education
//
//  Created by Samuelhuang on 1/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "MyScrollView.h"
#import "UIImageView+WebCache.h"

@interface MyScrollView()<UIScrollViewDelegate>

@property(nonatomic,strong)     UIScrollView *scrollView;
@property(nonatomic,strong)     UIPageControl *pageView;
@property (strong, nonatomic)   NSTimer *timer;
@property(nonatomic,strong)NSArray *itemArr;

@end

@implementation MyScrollView
{
    NSInteger count;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
 
    
    return self;
}

- (void)prepareScollView:(NSArray *)imageArr {
    self.itemArr = imageArr;
    CGFloat scrollW = [UIScreen mainScreen].bounds.size.width;
    CGFloat scrollH = 100;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollW, scrollH)];
    self.scrollView.delegate = self;

    count = imageArr.count;
    for (int i = 0; i <count; i++) {
         NSDictionary *info = imageArr[i];
        //NextType=1是课程详情页  2 是教师详情页 3是机构详情页
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:info[@"TuPianLink"]]];
        CGFloat imageX = scrollW * (i + 1);
        imageView.frame = CGRectMake(imageX, 0, scrollW, scrollH);
        [self.scrollView addSubview:imageView];
     }
    
    NSDictionary *firstInfo = imageArr[count-1];
    UIImageView *firstImage = [[UIImageView alloc] init];
    [firstImage  sd_setImageWithURL:[NSURL URLWithString:firstInfo[@"TuPianLink"]]];
    firstImage.frame = CGRectMake(0, 0, scrollW, scrollH);
    [self.scrollView addSubview:firstImage];
    self.scrollView.contentOffset = CGPointMake(scrollW, 0);
    
    NSDictionary *lastInfo = imageArr[0];
    UIImageView *lastImage = [[UIImageView alloc] init];
    [lastImage  sd_setImageWithURL:[NSURL URLWithString:lastInfo[@"TuPianLink"]]];
    lastImage.frame = CGRectMake((count + 1) * scrollW, 0, scrollW, scrollH);
    [self.scrollView addSubview:lastImage];
    self.scrollView.contentSize = CGSizeMake((count + 2) * scrollW, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
  
    
    [self addTimer];
    
    [self preparePageView];
}

-(void)preparePageView {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat pageW = 100;
    self.pageView = [[UIPageControl alloc] initWithFrame:CGRectMake((width - pageW) * 0.5, 80, pageW, 4)];
    self.pageView.numberOfPages = count;
    self.pageView.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageView.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageView.currentPage = 0;
    [self addSubview:self.pageView];
    
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [self addGestureRecognizer:singleRecognizer];

}

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)nextImage {
    CGFloat width = self.scrollView.frame.size.width;
    NSInteger index = self.pageView.currentPage;
    if (index == count + 1) {
        index = 0;
    } else {
        index++;
    }
    [self.scrollView setContentOffset:CGPointMake((index + 1) * width, 0)animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat width = self.scrollView.frame.size.width;
    NSInteger index = (self.scrollView.contentOffset.x + width * 0.5) / width;
    if (index == count + 2) {
        index = 1;
    } else if(index == 0) {
        index = count;
    }
    self.pageView.currentPage = index - 1;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width = self.scrollView.frame.size.width;
    int index = (self.scrollView.contentOffset.x + width * 0.5) / width;
    if (index == count + 1) {
        [self.scrollView setContentOffset:CGPointMake(width, 0) animated:NO];
    } else if (index == 0) {
        [self.scrollView setContentOffset:CGPointMake(count * width, 0) animated:NO];
    }
}   

-(void)singleTap:(UITapGestureRecognizer *)sender{

    // 获得索引
    NSUInteger index = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    NSDictionary *info = self.itemArr[index];
    [self sendObject:info];
}

@end
