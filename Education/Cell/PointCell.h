//
//  PointCell.h
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PointCell : UITableViewCell

@property (strong, nonatomic)  UIButton *btn1;
@property (strong, nonatomic)  UIButton *btn2;
@property (strong, nonatomic)  UIButton *btn3;
@property (strong, nonatomic)  UIButton *btn4;
@property (strong, nonatomic)  UIButton *btn5;
@property (strong, nonatomic)  UIButton *btn6;
@property (strong, nonatomic)  UIButton *btn7;
@property (strong, nonatomic)  UIButton *btn8;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
