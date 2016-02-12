//
//  BaseDAO.m
//  Combination
//
//  Created by MacBookAir on 15/5/29.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "BaseDAO.h"

@implementation BaseDAO
 

-(instancetype)init{
    if (self =  [super init]) {
        if (_manager==nil) {
            _manager = [AFHTTPSessionManager manager];
            _manager.requestSerializer = [AFJSONRequestSerializer serializer];
            _manager.responseSerializer =[AFHTTPResponseSerializer  serializer];
        }
    }
    return self;
}

//get
-(RACSignal *) rac_geturl:(NSString*)url parameters:(id) parameters retries:(NSInteger)retries interval:(NSTimeInterval)interval{

    return [_manager rac_GET:url parameters:parameters retries:retries interval:interval];
}

//post
-(RACSignal *) rac_posturl:(NSString*)url parameters:(id) parameters retries:(NSInteger)retries interval:(NSTimeInterval)interval{
    
    return [_manager rac_POST:url parameters:parameters retries:retries interval:interval];
    
    
}


//get
-(void)httpRequestGet:(NSDictionary*)parameters url:(NSString*)url withBlock:(void(^)(NSDictionary* dic,NSError* error))block{
 
 
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    parameters = @{@"foo": @"bar"};
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        block(parameters,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        block(nil,error);
    }];
    
}

//post
-(void)httpRequestPost:(NSDictionary*)parameters url:(NSString*)url withBlock:(void(^)(NSDictionary* dic,NSError* error))block{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
   // parameters = @{@"foo": @"bar"};
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath name:@"image" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        block(parameters,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
         block(nil,error);
    }];
    
}


@end
