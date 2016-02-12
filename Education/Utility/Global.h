//
//  Global.h
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"
#import "JSONKit.h"
#import <CommonCrypto/CommonDigest.h>

@interface Global : NSObject


+(void)archiverSetValue:(id)value key:(NSString*)key;

+(NSString*)unArchiverValue:(NSString*)key;

+(void)archiverData:(id)object key:(NSString*)key;

+(id)unArchiverData:(NSString*)key;
//获取udid 或者 idfv
+(NSString*)getUDIDorIDFV;

+(NSString *) md5: (NSString *) inPutText;

+(BOOL)isLogined;
@end
