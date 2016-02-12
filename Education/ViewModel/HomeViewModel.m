//
//  HomeModelView.m
//  Education
//
//  Created by MacBookAir on 15/6/11.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface HomeViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation HomeViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _smallCourseId = @"99999";
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

//分类导航
-(RACSignal *)getAd
{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":@"99998"};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"ListTuPianLB.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 [subscriber sendNext:resInfo[@"TuPianLunBoList"]];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];
}


//分类导航
-(RACSignal *)getCourseCategory
{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_category",@"sid":@"10001"};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"GetCourseCategory.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 [subscriber sendNext:resInfo[@"CourseCategoryList"]];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];
}

//熱門課程
-(RACSignal *)getListCourse
{

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":self.smallCourseId};
        
        
        [[_summaryDAO getApiwithParameters:paramert url:@"ListCourse.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 [subscriber sendNext:resInfo[@"CourseTypeList"]];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];

        
        return nil;
    }];
}

-(RACSignal *)getListTeacher{

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":@"99999"};
        
        
        [[_summaryDAO getApiwithParameters:paramert url:@"ListTeacher.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 [subscriber sendNext:resInfo[@"TeacherList"]];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];

}

//机构推荐
-(RACSignal *)getListOrg{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":self.smallCourseId};
        
        
        [[_summaryDAO getApiwithParameters:paramert url:@"ListOrg.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 [subscriber sendNext:resInfo[@"OrgList"]];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];
        return nil;
    }];
    
}


@end
