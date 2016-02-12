//
//  Config.h
//  51wm
//
//  Created by Vincent on 14-5-6.
//  Copyright (c) 2014年 wujia08@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "UIImage+Additions.h"
//#import "NSNumberFormatter+StringValue.h"
//#import "NSString+TextSize.h"
//#import "UIAlertView+CMAdditions.h"


enum ReportCategory{
    ReportCategory_SSS,
    ReportCategory_FSS
};



//MARK: 配置
#define APP_KEY             @"QUAMALL"
#define APP_SECRET          @"a4923010-c2e9-11e4-8830-0800200c9a66"
#define APP_DEMOAPI      @"http://120.25.158.79/aipinkedemo/do/"
#define APP_Member_DEMOAPI      @"http://120.25.158.79/aipinkedemo/members/"
#define APP_Developement    @"http://223.197.51.195:10080/managementReport/"
#define APP_Ser_AWONG       @"disclaimers_awong.action"
#define APP_Ser_VICTOR      @"disclaimers_victorho.action"
#define APP_Ser_QUAMALPHA   @"disclaimers_quamalpha.action"
#define APP_Ser_COLIN       @""
#define APP_Ser_PATRICK     @""
#define APP_Ser_SKY         @""

#define K_USERINFO          @"K_USERINFO"
#define K_MYUDID            @"my_udid"
//MARK 其他配置
#define K_D_FONT        17
#define K_N_FONT        14
#define K_S_FONT        12


#define Width self.view.frame.size.width
#define SwipView_Height 160 //顶部滚动图高度

// Logging
#ifdef DEBUG
#define DLOG(...)       NSLog(__VA_ARGS__)
#else
#define DLOG(...)
#endif


#define WEAK_VAR(var, obj)  __weak typeof(obj) var = obj

// String
#define EMPTY_STRING        @""
#define LOC_STRING(key)     NSLocalizedString((key), nil)
#define STR_NIL2EMPTY(str)  ((str)?(str):EMPTY_STRING)

// Null
#define NIL2NULL(obj)       ((obj)?(obj):[NSNull null])

// Color
// Use OMColorSence
//#define COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:((float)(r)/255.0f) green:((float)(g)/255.0f) blue:((float)(b)/255.0f) alpha:(a)]
//#define COLOR_RGB(r,g,b)    COLOR_RGBA(r,g,b,1.0f)

// File System
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


#define RESOURCE_FILE(f)    [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:(f)]

// Layout
#define MAIN_SCREEN_BOUNDS          [[UIScreen mainScreen] bounds]
#define MAIN_SCREEN_BOUNDS_WIDTH    MAIN_SCREEN_BOUNDS.size.width
#define MAIN_SCREEN_BOUNDS_HEIGHT   MAIN_SCREEN_BOUNDS.size.height

// Singleton
// Adopt From BeeFramework:https://github.com/gavinkwoe/BeeFramework
#define SINGLETON_DECL(cls, mth)                                                        \
+ (instancetype)mth

#define SINGLETON_IMPL(cls, mth)                                                     \
+ (instancetype)mth {                                                           \
static __typeof__(cls)* __singleton__;                                      \
static dispatch_once_t once;                                                \
dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init];});     \
return __singleton__;                                                       \
}

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define SYSVERSION         [[[UIDevice currentDevice] systemVersion] description]
#define CURR_LANG             ([[NSLocale preferredLanguages] objectAtIndex:0])

#define WIDTH [UIScreen mainScreen].applicationFrame.size.width  //WIDTH
#define HEIGHT self.view.frame.size.height //HEIGHT
//顏色
#define RGCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]
#define RGCOLORA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


//屏膜寬度
#define SCREEN_VIEW_WIDTH  [UIScreen mainScreen].bounds.size.width
//屏膜高度
#define SCREEN_VIEW_HEIGHT  [UIScreen mainScreen].bounds.size.height

// 判断是否为iOS7
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

// 判断是否为iOS8
#define iOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//
#define Small_Screen ([[UIScreen mainScreen] bounds].size.height == 480)

#define kLaunchedBefore @"launchedBefore" // 是否已经启动过

#define kHomeFirstRefresh @"HomeFirstRefresh"
//广告
#define AD_URL @"http://www.quamnet.com/QuamMsgCenterBanner.html"
//无服务跳转
#define NO_SERVER_AD @"https://www.quamnet.com/"

#define TICK   NSDate *startTime = [NSDate date];
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);

//数码格 宽度
#define kWidth  100
//数码格 高度
#define kHeight 40.0
//数码格 宽距
#define kWidthMargin 1
//数码格 高距
#define kHeightMargin 3
//表头字体大小
#define K_HEAD_FONT 15
//内容字体大小
#define K_BODY_FONT 13
