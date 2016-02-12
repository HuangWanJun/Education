//
//  BaseDAO.h
//  Combination
//
//  Created by MacBookAir on 15/5/29.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <AFHTTPSessionManager+RACRetrySupport.h>
#import "Config.h"

@interface BaseDAO : NSObject

@property (nonatomic,strong) AFHTTPSessionManager *manager;

//get
-(RACSignal *) rac_geturl:(NSString*)url parameters:(id) parameters retries:(NSInteger)retries interval:(NSTimeInterval)interval;

//post
-(RACSignal *) rac_posturl:(NSString*)url parameters:(id) parameters retries:(NSInteger)retries interval:(NSTimeInterval)interval;

-(void)httpRequestGet:(NSDictionary*)parameters url:(NSString*)url withBlock:(void(^)(NSDictionary* dic,NSError* error))block;

-(void)httpRequestPost:(NSDictionary*)parameters url:(NSString*)url withBlock:(void(^)(NSDictionary* dic,NSError* error))block;

@end
