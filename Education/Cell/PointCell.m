//
//  PointCell.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "PointCell.h"
#import "Config.h"


@implementation PointCell
{
    NSArray* titleArr;
    NSArray* viewArr;
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
    
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
    __weak __typeof(&*self)weaksSelf = self;

    self.backgroundColor=[UIColor clearColor];
  
    self.btn1 = [UIButton new];
    [self.contentView addSubview:self.btn1];

    self.btn2 = [UIButton new];
    self.btn2.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn2];
    self.btn3 = [UIButton new];
    self.btn3.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn3];
    self.btn4 = [UIButton new];
    self.btn4.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn4];
    
    self.btn5 = [UIButton new];
    self.btn5.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn5];

    self.btn6 = [UIButton new];
    self.btn6.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn6];

    
    self.btn7 = [UIButton new];
    self.btn7.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn7];
    
    self.btn8 = [UIButton new];
    self.btn8.backgroundColor=[UIColor greenColor];
    [self.contentView addSubview:self.btn8];
    
    NSInteger padge=  (SCREEN_VIEW_WIDTH-4*40)/5;
    NSInteger top_padge=5;
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@40);
        make.left.equalTo(weaksSelf.mas_left).offset(padge);
        make.top.equalTo(weaksSelf.mas_top).offset(top_padge);
        make.right.equalTo(weaksSelf.btn2.mas_left).offset(-padge);
    }];
    
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1.mas_width);
        make.height.equalTo(weaksSelf.btn1.mas_height);
        make.left.equalTo(weaksSelf.btn1.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.mas_top).offset(top_padge);
        make.right.equalTo(weaksSelf.btn3.mas_left).offset(-padge);
    }];
    
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1);
        make.height.equalTo(weaksSelf.btn1);
        make.left.equalTo(weaksSelf.btn2.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.mas_top).offset(top_padge);
        make.right.equalTo(weaksSelf.btn4.mas_left).offset(-padge);
    }];
    
    [self.btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1);
        make.height.equalTo(weaksSelf.btn1);
        make.left.equalTo(weaksSelf.btn3.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.mas_top).offset(top_padge);
        make.right.equalTo(weaksSelf.mas_right).offset(-padge);
    }];
    
    [self.btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1.mas_width);
        make.height.equalTo(weaksSelf.btn1.mas_height);
        make.left.equalTo(weaksSelf.mas_left).offset(padge);
        make.top.equalTo(weaksSelf.btn1.mas_bottom).offset(top_padge*5);
        make.right.equalTo(weaksSelf.btn6.mas_left).offset(-padge);
    }];
    
    [self.btn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1.mas_width);
        make.height.equalTo(weaksSelf.btn1.mas_height);
        make.left.equalTo(weaksSelf.btn5.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.btn2.mas_bottom).offset(top_padge*5);
        make.right.equalTo(weaksSelf.btn7.mas_left).offset(-padge);
    }];

    [self.btn7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1);
        make.height.equalTo(weaksSelf.btn1);
        make.left.equalTo(weaksSelf.btn6.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.btn3.mas_bottom).offset(top_padge*5);
        make.right.equalTo(weaksSelf.btn8.mas_left).offset(-padge);
    }];
    
    [self.btn8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weaksSelf.btn1);
        make.height.equalTo(weaksSelf.btn1);
        make.left.equalTo(weaksSelf.btn7.mas_right).offset(padge);
        make.top.equalTo(weaksSelf.btn4.mas_bottom).offset(top_padge*5);
        make.right.equalTo(weaksSelf.mas_right).offset(-padge);
    }];
    
 
    titleArr = @[@"领导力",@"职业素养",@"专业技能",@"专业技能1",@"通用管理",@"互联网",@"营销",@"营销1"];
    viewArr = @[self.btn1,self.btn2,self.btn3,self.btn4,self.btn5,self.btn6,self.btn7,self.btn8,];
    for (int i=0; i<viewArr.count; i++) {
        UIButton* btn = viewArr[i];
        btn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"ic_%@", @(i+1)]]];
        UILabel* lable = [UILabel new];
      //  lable.backgroundColor=[UIColor orangeColor];
        lable.text = titleArr[i];
        [btn addSubview:lable];
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(btn.mas_centerX);
           // make.size.mas_equalTo(CGSizeMake(30, 10));
            make.bottom.mas_equalTo(btn.mas_bottom).offset(18);
           // make.left.mas_equalTo(view.mas_left);
          //  make.right.mas_equalTo(view.mas_right);
            make.height.mas_equalTo(@15);
        }];
        
    }
}

@end
