//
//  CourseCell.h
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrgCell : UITableViewCell

-(void)config:(NSDictionary *)info;

-(void)config2:(NSDictionary *)info;
//教師詳情
-(void)configTeacherDetial:(NSDictionary *)info;
//機構詳情
-(void)configOrg:(NSDictionary *)info;
@end
