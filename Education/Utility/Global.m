//
//  Global.m
//  Education
//
//  Created by MacBookAir on 15/6/6.
//  Copyright (c) 2015年 el2333. All rights reserved.
//

#import "Global.h"

@implementation Global

+(void)archiverSetValue:(id)value key:(NSString*)key
{
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    [ud setValue:value forKey:key];
    [ud synchronize];
}

+(NSString*)unArchiverValue:(NSString*)key
{
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    return [ud valueForKey:key];
}

#pragma mark -
#pragma mark archer

+(void)archiverData:(id)object key:(NSString*)key
{
    NSData* data=[NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *ud= [NSUserDefaults standardUserDefaults];
    [ud setObject:data forKey:key];
    [ud synchronize];
}


+(id)unArchiverData:(NSString*)key
{
    NSUserDefaults *ud= [NSUserDefaults standardUserDefaults];
    NSData* data=[ud objectForKey:key];
    if (data==nil) {
        return nil;
    }
    id my_object=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return my_object;
}

//获取udid 没有就取 idfv
+(NSString*)getUDIDorIDFV{
    NSString* udid=[self unArchiverValue:K_MYUDID];
    if (!udid) {
        udid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return udid;
}

+(BOOL)isLogined{
    return  [self unArchiverData:K_USERINFO] ? YES : NO;
}


//md5 32位 加密 （小写）
+(NSString *) md5: (NSString *) inPutText
{
    const char *cStr = [inPutText UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}




//md5 16位加密 （大写）
/*
-(NSString *)md5:(NSString *)str {
    
    
    
    constchar *cStr = [str UTF8String];
    
    
    
    unsigned result[16];
    
    
    
    CC_MD5( cStr, strlen(cStr), result );
    
    
    
    return [NSStringstringWithFormat:
            
            
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            
            
            
            result[0], result[1], result[2], result[3],
            
            
            
            result[4], result[5], result[6], result[7],
            
            
            
            result[8], result[9], result[10], result[11],
            
            
            
            result[12], result[13], result[14], result[15]
            
            
            
            ]; 
    
    
    
}
*/

@end
