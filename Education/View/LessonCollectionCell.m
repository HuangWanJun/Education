//
//  LessonCollectionCell.m
//  Education
//
//  Created by MacBookAir on 15/6/8.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "LessonCollectionCell.h"

@implementation LessonCollectionCell

- (void)awakeFromNib {
}

 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        
//        self.lessonNameLbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(self.frame)-10, 20)];
        self.lessonNameLbl = [UILabel new];
         [self addSubview:self.lessonNameLbl];
        self.lessonNameLbl.numberOfLines=10;
        __weak __typeof(&*self)weaksSelf = self;
        
        [self.lessonNameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(weaksSelf).offset(5);
            make.height.mas_greaterThanOrEqualTo(@30);
        }];

       
        
      
    }
    return self;
}


@end
