//
//  MyImgLabel.m
//  Education
//
//  Created by Samuelhuang on 25/12/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import "MyImgLabel.h"

@implementation MyImgLabel

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    //self.font  = [UIFont systemFontOfSize:17];
    return self;
}

-(void)setImageName:(NSString *)imageName Title:(NSString*)title{

    if (imageName) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 3, 13, 13)];
        img.image = [UIImage imageNamed:imageName];
        [self addSubview:img];
        self.text = [NSString stringWithFormat:@"     %@",title];
    }else{
        self.text = title;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
