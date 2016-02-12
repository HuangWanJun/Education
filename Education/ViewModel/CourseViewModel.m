//
//  CourseViewModel.m
//  Education
//
//  Created by Samuelhuang on 11/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "CourseViewModel.h"
#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface CourseViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation CourseViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

-(RACSignal *)getCurseType{

    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":self.bigCourseId};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"GetType.php"]
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

//課程詳情
-(RACSignal *)getCourseDetail{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"Cdetail",@"sid":self.courseId};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"CourseDetail.php"]
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




@end
