//
//  OrgViewModel.m
//  Education
//
//  Created by Samuelhuang on 12/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "OrgViewModel.h"
#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface OrgViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation OrgViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

-(RACSignal *)getOrgDetail{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary* paramert = @{@"Pfun":@"get_ctype",@"sid":self.orgId};
        
        [[_summaryDAO getApiwithParameters:paramert url:@"OrgDetail.php"]
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
