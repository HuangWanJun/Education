//
//  CourseCell.m
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "OrgCell.h"
#import "Teacher.h"
#import "Organization.h"

@interface OrgCell()


@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *oneLbl;
@property (weak, nonatomic) IBOutlet UILabel *twoLbl;
@property (weak, nonatomic) IBOutlet UILabel *threeLbl;
@property (weak, nonatomic) IBOutlet UILabel *fourLbl;
@property (weak, nonatomic) IBOutlet UILabel *fiveLbl;


@end

@implementation OrgCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)config:(NSDictionary *)info{
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    Teacher *item = [Teacher mj_objectWithKeyValues:info];
    [self.leftImage sd_setImageWithURL:[NSURL URLWithString:item.TuXiangLink]];
    self.oneLbl.text = item.TeacherName;
    self.twoLbl.text = item.TeacherMajor;
    self.threeLbl.text = item.TeacherAchievement;
    self.fourLbl.text  = item.TeacherCourses;
    self.fiveLbl.text = item.TeacherSCustomer;
}

-(void)config2:(NSDictionary *)info{
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    Organization *item = [Organization mj_objectWithKeyValues:info];
    self.oneLbl.text = item.OrgName;
    self.twoLbl.text = item.NumOfTeacher;
    self.threeLbl.text = item.NumOfCourse;
    self.fourLbl.text = item.OrgMSG;
    self.fiveLbl.text = [NSString stringWithFormat:@"%@%@%@",item.OrgAchievement,item.NumOfCert,item.NumOfVote];
    //self.oneLbl.text = item.teacherName;
}

-(void)configTeacherDetial:(NSDictionary *)info{
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    Teacher *item = [Teacher mj_objectWithKeyValues:info];
    [self.leftImage sd_setImageWithURL:[NSURL URLWithString:item.TuXiangLink]];
    self.oneLbl.text = item.TeacherName;
    self.twoLbl.text =   [NSString stringWithFormat:@"好评率:%@", item.PraiseRate];
    self.threeLbl.text = item.TeacherAchievement;
    self.fourLbl.text  = item.TeacherMSG;
    self.fiveLbl.text = [NSString stringWithFormat:@"%@%@%@",item.IdtCertIf,item.TecherCertIf,item.EduCertIf];
}

-(void)configOrg:(NSDictionary *)info{

    Organization *item = [Organization mj_objectWithKeyValues:info];
   // [self.leftImage sd_setImageWithURL:[NSURL URLWithString:item.]];
    self.oneLbl.text = item.OrgName;
    self.twoLbl.text =   [NSString stringWithFormat:@"%@场可报课程", item.NumOfCourse];
    self.threeLbl.text = item.OrgMSG;

}


@end
