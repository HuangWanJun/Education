//
//  OrderViewModel.m
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import "OrderViewModel.h"
#import "HomeReformer.h"
#import "SummaryDAO.h"
#import "Global.h"

@interface OrderViewModel()

@property(nonatomic,strong)HomeReformer *reformer;
@property(nonatomic,strong)SummaryDAO *summaryDAO;

@end

@implementation OrderViewModel

-(instancetype)init{
    
    self = [super init];
    if(self){
        
        _reformer = [HomeReformer new];
        _summaryDAO = [SummaryDAO new];
    }
    return self;
}

-(RACSignal *)OrderSignal{
    
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary *info =  [Global unArchiverData:K_USERINFO];
        NSString* uid = [info[@"uid"] description];
        NSString* sessionid = info[@"sessionid"];
        //sid //stdid
        NSDictionary* paramert = @{@"stdid":uid,@"Pfun":@"put_order",@"sid":sessionid,@"CourseID":self.courseID,@"BKmoney":self.BKmoney};
        
        [[_summaryDAO postApiwithMemberParameters:paramert url:@"MPutOrder.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
             responseString = [responseString substringFromIndex:1];
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                     [subscriber sendNext:@(1)];
             }else{
                 [subscriber sendNext:@(0)];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];
    
}

-(RACSignal *)getOrderSignal{
    
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSDictionary *info =  [Global unArchiverData:K_USERINFO];
        NSString* uid = [info[@"uid"] description];
        NSString* sessionid = info[@"sessionid"];
        
        NSDictionary* paramert = @{@"stdid":uid,@"Pfun":@"get_order",@"sid":sessionid};
        
        [[_summaryDAO postApiwithMemberParameters:paramert url:@"MGetOrder.php"]
         subscribeNext:^(RACTuple *response) {
             NSString *responseString = [[NSString alloc] initWithData: response.first encoding:NSUTF8StringEncoding];
              responseString = [responseString substringFromIndex:1];
             NSDictionary *resInfo = [responseString  objectFromJSONString];
             BOOL res = [_reformer successApi:resInfo];
             if(res){
                 NSArray *datas =  resInfo[@"OrderList"];
                 if (datas.count>0) {
                     [subscriber sendNext:datas];
                 }else
                     [subscriber sendNext:nil];
                 
             }else{
                 [subscriber sendNext:nil];
             }
             [subscriber sendCompleted];
         }];
        
        
        return nil;
    }];
    
}


@end
