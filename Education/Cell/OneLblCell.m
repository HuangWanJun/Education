//
//  OneLblCell.m
//  Education
//
//  Created by Samuelhuang on 26/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "OneLblCell.h"
#import "UIView+SDAutoLayout.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@implementation OneLblCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setOneTxt:(NSString *)oneTxt{

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.oneLbl.sd_layout
    .topSpaceToView(self.contentView,8)
    .leftSpaceToView(self.contentView,8)
    .rightSpaceToView(self.contentView,8)
    .autoHeightRatio(0);

    _oneLbl.text = oneTxt;
    
    //***********************高度自适应cell设置步骤 1************************
    [self setupAutoHeightWithBottomView:_oneLbl bottomMargin:10];
    
}





@end
