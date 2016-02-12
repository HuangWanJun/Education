//
//  TeacherCellTableViewCell.m
//  Education
//
//  Created by MacBookAir on 15/6/11.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "TeacherCellTableViewCell.h"

@implementation TeacherCellTableViewCell
{
    NSArray *introduceArr ;
    NSArray *teacherArr;
    NSArray *introduceLabelArr;
        NSArray *teacherLabelArr;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self layoutUI];
    }
    
    return self;
}


-(void)layoutUI{
   
    self.introduceLabel = [UILabel new];
    [self.contentView addSubview:self.introduceLabel];
    
    self.teacherLabel = [UILabel new];
    [self.contentView addSubview:self.teacherLabel];
 
    self.teachImageView = [UIImageView new];
    [self.contentView addSubview:self.teachImageView];
    
     __weak __typeof(&*self)weaksSelf = self;
    
    [self.teachImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.mas_equalTo(weaksSelf.mas_top).offset(5);
        make.left.mas_equalTo(weaksSelf.mas_left).offset(5);
    }];
    
    [self.introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weaksSelf.mas_top).offset(10);
        make.left.mas_equalTo(weaksSelf.teachImageView.mas_right).offset(5);
        make.right.mas_equalTo(weaksSelf.mas_right).offset(-5);
        make.height.mas_equalTo(@15);
    }];
    
    [self.teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weaksSelf.introduceLabel.mas_bottom).offset(10);
         make.left.mas_equalTo(weaksSelf.teachImageView.mas_right).offset(5);
         make.right.mas_equalTo(weaksSelf.mas_right).offset(-5);
         make.height.mas_equalTo(@15);
    }];
    
    
    

}

@end
