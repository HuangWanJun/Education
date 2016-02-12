//
//  HomeLessonCell.h
//  Education
//
//  Created by MacBookAir on 15/6/17.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeLessonCell : UITableViewCell

@property UIImageView   *logoImage;
@property UILabel       *titleLbl;
@property UILabel       *descLbl;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
