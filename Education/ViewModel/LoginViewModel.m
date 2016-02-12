//
//  LoginViewModel.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "LoginViewModel.h"


#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface LoginViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation LoginViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

-(RACSignal *)loginSignal{
    
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSString *md5 = [Global md5:[NSString stringWithFormat:@"%@.%@",@"test123",@"0902"] ];
        NSDictionary* paramert = @{@"useracc":@"be@pd.com",@"type":@"onlinedo",@"deviceid":@"IOSPost",@"salt":@"0902",@"userpw":md5};
        
        [[_summaryDAO postApiwithMemberParameters:paramert url:@"login.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             responseString = [responseString substringFromIndex:2];
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successMemberApi:resInfo];
             if(res){
                  NSArray *datas =  resInfo[@"datas"];
                 if (datas.count>0) {
                     [Global archiverData:datas[0] key:K_USERINFO];
                     [subscriber sendNext:@(1)];
                 }else
                     [subscriber sendNext:@(0)];
                 
             }else{
                 [subscriber sendNext:@(0)];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];
    
}




@end
