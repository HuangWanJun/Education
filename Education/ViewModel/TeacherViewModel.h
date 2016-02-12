//
//  TeacherViewModel.h
//  Education
//
//  Created by Samuelhuang on 28/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeacherViewModel : NSObject


@property(nonatomic,strong)NSString *teacherId;

-(RACSignal *)getTeacherDetail;
@end
