//
//  TeacherCellTableViewCell.h
//  Education
//
//  Created by MacBookAir on 15/6/11.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeacherCellTableViewCell : UITableViewCell

@property   UILabel* introduceLabel;
@property   UILabel* teacherLabel;
@property   UIImageView* teachImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
