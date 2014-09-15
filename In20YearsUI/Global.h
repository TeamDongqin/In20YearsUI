//
//  NSObject_Global.h
//  TCLSales
//
//  Created by ken liu on 14-1-16.
//  Copyright (c) 2014年 Insigma. All rights reserved.
//

//字体
#define KcommonFont @"Regular"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0)

#define IOS7Hight ([[[UIDevice currentDevice] systemVersion] floatValue]>= 7.0 ? 20  : 0)

//主窗口的宽、高
#define MainScreenWidth  [UIScreen mainScreen].bounds.size.width
#define MainScreenHeight [UIScreen mainScreen].bounds.size.height

//角度与弧度转换
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(x) (180.0 * (x) / M_PI)

//判断设备是否是ipad
#define isiPad        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)


//判断设备是否IPHONE5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//简化代码
#define ReturnIfExp(exprsion,action)          if ((exprsion)) {action;return;}
#define ContinueIf(expr)            if ((expr))  { continue;     }
#define BreakIf(expr)               if ((expr))  { break;        }
#define ActionIf(expr,action)       if ((expr))  { action;       }
#define ReturnIf(expr)              if ((expr))  { return;       }
#define ReturnValIf(expr, val)      if ((expr))  { return (val); }
#define ContinueIfNot(expr)         if (!(expr)) { continue;     }
#define BreakIfNot(expr)            if (!(expr)) { break;        }
#define ReturnIfNot(expr)           if (!(expr)) { return;       }
#define ReturnValIfNot(expr, val)   if (!(expr)) { return (val); }

//Core
#import "Singleton.h"

//UI
#import "UIView+CustomAutoLayout.h"
#import "UIColor+MLPFlatColors.h"
#import "UIButton+Common.h"
#import "IOSDeviceConfig.h"



#define AlterMessage(message,time) [[HUDHelper sharedInstance] tipMessage:message delay:time]
