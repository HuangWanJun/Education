//
//  HomeLessonCell.m
//  Education
//
//  Created by MacBookAir on 15/6/17.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "HomeLessonCell.h"

@implementation HomeLessonCell

- (void)awakeFromNib {
 
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self layoutUI];
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutUI{

    self.logoImage = [UIImageView new];
    [self.contentView addSubview:self.logoImage];
    
    self.titleLbl = [UILabel new];
    [self.contentView addSubview:self.titleLbl];
    
    self.descLbl = [UILabel new];
    [self.contentView addSubview:self.descLbl];
    
    NSInteger padge = 10;
    @weakify(self);
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.mas_equalTo(self.contentView.mas_top).offset(padge);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padge);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
         @strongify(self);
        make.top.mas_equalTo(self.contentView.mas_top).offset(padge);
         make.size.mas_equalTo(CGSizeMake(1000, 10));
        make.left.mas_equalTo(self.contentView.mas_left).offset(padge);
    }];
    
    [self.descLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-padge);
        make.size.mas_equalTo(CGSizeMake(1000, 10));
        make.left.mas_equalTo(self.contentView.mas_left).offset(padge);
    }];
    
}

@end
