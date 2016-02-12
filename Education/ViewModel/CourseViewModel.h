//
//  CourseViewModel.h
//  Education
//
//  Created by Samuelhuang on 11/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseViewModel : NSObject
@property(nonatomic,strong)NSString *bigCourseId; //大類別id
@property(nonatomic,strong)NSString *courseId;//課程id

-(RACSignal *)getCurseType;
//課程詳情
-(RACSignal *)getCourseDetail;
@end
