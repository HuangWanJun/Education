//
//  OrderViewModel.h
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderViewModel : NSObject
@property(nonatomic,strong)NSString *courseID;
@property(nonatomic,strong)NSString *BKmoney;

-(RACSignal *)OrderSignal;
-(RACSignal *)getOrderSignal;
@end
