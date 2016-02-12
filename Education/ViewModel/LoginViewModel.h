//
//  LoginViewModel.h
//  Education
//
//  Created by Samuelhuang on 2/2/2016.
//  Copyright © 2016年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property(nonatomic,strong)NSString *userName;
@property(nonatomic,strong)NSString *pwd;



-(RACSignal *)loginSignal;


@end
