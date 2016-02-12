//
//  LoginCell.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "LoginCell.h"

@interface LoginCell()

@property (weak, nonatomic) IBOutlet UIImageView *profileimage;
@property (weak, nonatomic) IBOutlet UILabel *loginLbl;

@end

@implementation LoginCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

-(void)config:(NSDictionary *)info{
    self.loginLbl.text = info[@"UserName"];
}

@end
