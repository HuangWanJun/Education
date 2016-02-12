//
//  LessonView.h
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LessonView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property NSInteger number;
@property (strong, nonatomic) UICollectionView *collectionView;

-(void)layoutUI;
-(void)initData;
@end
