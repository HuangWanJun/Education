//
//  StartDAO.h
//  Combination
//
//  Created by MacBookAir on 15/5/29.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDAO.h"

@interface SummaryDAO : BaseDAO

-(RACSignal *) postApiwithMemberParameters:(id) parameters url:(NSString*)rul;
-(RACSignal *) getApiwithParameters:(id) parameters url:(NSString*)rul;
-(RACSignal *) postApiwithParameters:(id) parameters url:(NSString*)rul;

@end
