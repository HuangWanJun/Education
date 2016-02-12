//
//  CourseCell.h
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseCell : UITableViewCell
@property(nonatomic,weak)UINavigationController *nav;


-(void)config:(NSDictionary *)info;
@end
