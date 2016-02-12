//
//  TeacherViewModel.m
//  Education
//
//  Created by Samuelhuang on 28/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "TeacherViewModel.h"

#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface TeacherViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation TeacherViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

-(RACSignal *)getTeacherDetail{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":self.teacherId};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"TeacherDetail.php"]
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




@end
