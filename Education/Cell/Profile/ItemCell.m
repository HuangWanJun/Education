//
//  ItemCell.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "ItemCell.h"


@interface ItemCell ()
@property (weak, nonatomic) IBOutlet UIImageView *smallimg;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;


@end


@implementation ItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)config:(NSDictionary *)info{
    self.smallimg.image = [UIImage imageNamed:info[@"img"]];
    self.titleLbl.text = info[@"title"];
}

@end
