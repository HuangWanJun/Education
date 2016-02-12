//
//  OrgViewModel.h
//  Education
//
//  Created by Samuelhuang on 12/1/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrgViewModel : NSObject

@property(nonatomic,strong)NSString *orgId;

-(RACSignal *)getOrgDetail;

@end
