//
//  LessonCell.m
//  Education
//
//  Created by MacBookAir on 15/6/8.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "LessonCell.h"

@implementation LessonCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self==nil)return nil;
    
    return self;
    
    
}

- (void)awakeFromNib {
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

 
}

@end
