//
//  HomeModelView.h
//  Education
//
//  Created by MacBookAir on 15/6/11.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeViewModel : NSObject

@property(nonatomic,strong)NSString *smallCourseId;

//ad圖片
-(RACSignal *)getAd;
//分类导航
-(RACSignal *)getCourseCategory;
//热门课程
-(RACSignal *)getListCourse;
//名师推荐
-(RACSignal *)getListTeacher;
//机构推荐
-(RACSignal *)getListOrg;
@end
