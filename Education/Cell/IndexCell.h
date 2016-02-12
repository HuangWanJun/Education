//
//  IndexCell.h
//  Education
//
//  Created by Samuelhuang on 21/10/2015.
//  Copyright © 2015年 el2333. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *teacherImg;
@property (weak, nonatomic) IBOutlet UILabel *titleTxt;
@property (weak, nonatomic) IBOutlet UILabel *teacherTxt;
@property (weak, nonatomic) IBOutlet UILabel *timeTxt;
@property (weak, nonatomic) IBOutlet UILabel *buyTxt;

@end
