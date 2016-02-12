//
//  StartDAO.m
//  Combination
//
//  Created by MacBookAir on 15/5/29.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "SummaryDAO.h"

static const NSString *contentALlUrl = @"api.php";


@implementation SummaryDAO

-(RACSignal *) postApiwithParameters:(id) parameters url:(NSString*)rul{
    NSString* newUrl = [NSString stringWithFormat:@"%@%@",APP_DEMOAPI,rul];
    DLOG(@"request Url:%@",newUrl);
    return [super rac_posturl:newUrl parameters:parameters retries:3 interval:3];
}

-(RACSignal *) postApiwithMemberParameters:(id) parameters url:(NSString*)rul{
    NSString* newUrl = [NSString stringWithFormat:@"%@%@",APP_Member_DEMOAPI,rul];
    DLOG(@"request Url:%@",newUrl);
    return [super rac_posturl:newUrl parameters:parameters retries:3 interval:3];
}

-(RACSignal *) getApiwithParameters:(id) parameters url:(NSString*)rul{
    NSString* newUrl = [NSString stringWithFormat:@"%@%@",APP_DEMOAPI,rul];
    DLOG(@"request Url:%@",newUrl);
    return [super rac_geturl:newUrl parameters:parameters retries:3 interval:3];
}




//start Api
-(void)startApi:(NSDictionary*)parameters  withBlock:(void(^)(NSDictionary* dic,NSError* error))block{
    
    NSString* url;
 
    [super httpRequestGet:parameters url:url withBlock:^(NSDictionary *dic, NSError *error) {
        
    }];
}

//Login Api
-(void)LoginApi:(NSDictionary*)parameters  withBlock:(void(^)(NSDictionary* dic,NSError* error))block{
    
    NSString* url;
    
    [super httpRequestGet:parameters url:url withBlock:^(NSDictionary *dic, NSError *error) {
        
    }];
}

//logout Api
-(void)logoutApi:(NSDictionary*)parameters  withBlock:(void(^)(NSDictionary* dic,NSError* error))block{
    
    NSString* url;
    
    [super httpRequestGet:parameters url:url withBlock:^(NSDictionary *dic, NSError *error) {
        
    }];
}

@end
