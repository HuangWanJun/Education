//
//  CourseCell.m
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "CourseCell.h"
#import "CourseType.h"
#import "MyImgLabel.h"
#import "OrderViewModel.h"
#import "Global.h"
#import "LoginViewController.h"
#import "CourseDetailViewController.h"

@interface CourseCell()

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet MyImgLabel *firstLbl;
@property (weak, nonatomic) IBOutlet MyImgLabel *twoLbl;
@property (weak, nonatomic) IBOutlet MyImgLabel *threeLbl;
@property (weak, nonatomic) IBOutlet MyImgLabel *fourLbl;
@property (weak, nonatomic) IBOutlet MyImgLabel *fiveLbl;
@property (weak, nonatomic) IBOutlet MyImgLabel *sixLbl;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;

@property(nonatomic,strong)NSDictionary *info;

@end

@implementation CourseCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)config:(NSDictionary *)infoDic{
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    self.info = infoDic;
    CourseType *item = [CourseType mj_objectWithKeyValues:self.info];
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:item.TuXiangLink]];

    self.firstLbl.text = item.CourseName;
    self.twoLbl.text =  [NSString stringWithFormat:@"¥ %@",item.PinPrice];
    [self.threeLbl  setImageName:@"metab" Title:item.TeacherName];
    [self.fourLbl setImageName:@"time" Title:item.CourseOpenDate];
    self.fiveLbl.text =  [NSString stringWithFormat:@"已有%@人报名",item.OrderNum];
    NSInteger num = [item.PinMemberNum integerValue] - [item.OrderNum integerValue];
    self.sixLbl.text = [NSString stringWithFormat:@"剩余%ld人",num];
}

- (IBAction)orderEvent:(id)sender {
    
    if (![Global isLogined ]) {
        LoginViewController *vc =  [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.nav presentViewController:vc animated:YES completion:nil];
        return;
   }
    
    [JCAlertView showTwoButtonsWithTitle:@"预订课程" Message:@"现在下单" ButtonType:JCAlertViewButtonTypeDefault ButtonTitle:@"确认" Click:^{
        
        OrderViewModel *viewModel = [OrderViewModel new];
        viewModel.courseID = self.info[@"CourseID"];
        viewModel.BKmoney = self.info[@"PinPrice"];
        [viewModel.OrderSignal subscribeNext:^(NSNumber *valid) {
            if ([valid boolValue]) {
                [SVProgressHUD showSuccessWithStatus:@"下單成功"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"下單出错"];
            }
        }];
        
        
    } ButtonType:JCAlertViewButtonTypeCancel ButtonTitle:@"取消" Click:^{
        
    }];
}



@end
