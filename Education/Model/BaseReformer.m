//
//  BaseReformer.m
//  Education
//
//  Created by MacBookAir on 15/7/31.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "BaseReformer.h"

@implementation BaseReformer


-(BOOL)successApi:(NSDictionary *)info{
    
    
    NSString *success = info[@"state"];
    return [success isEqualToString:@"success"];
}

-(BOOL)successMemberApi:(NSDictionary *)info{
    
    
    NSString *success = [info[@"code"] description];
    return [success isEqualToString:@"200"];
}

@end
