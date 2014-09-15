
//
//  IOSDeviceConfig.m
//  HKRemote
//
//  Created by ken liu on 13-1-11.
//  Copyright (c) 2013年 ken liu. All rights reserved.
//

#import "IOSDeviceConfig.h"
#import "IOSDeviceMacro.h"


@implementation IOSDeviceConfig

static IOSDeviceConfig *_sharedConfig = nil;


@synthesize isIPad = _isIPad;
@synthesize isIPhone = _isIPhone;
@synthesize isIPhone4 = _isIPhone4;
@synthesize isIPhone5 = _isIPhone5;
@synthesize isIOS7= _isIOS7;

@synthesize isPortrait = _isPortrait;

@synthesize deviceUUID = _deviceUUID;

+ (IOSDeviceConfig *)sharedConfig
{
    @synchronized(_sharedConfig)
    {
        if (_sharedConfig == nil) {
            _sharedConfig = [[IOSDeviceConfig alloc] init];
        }
        return _sharedConfig;
    }
}

- (void)dealloc
{
    //[_deviceUUID release];
    //[super dealloc];
}


- (id) init
{
	if (self = [super init])
	{
        _isIPad = isIPad();
        _isIPhone = isIPhone();
        _isIPhone4 = isIPhone4();
        _isIPhone5 = isIPhone5();
        _isIOS7 = isIOS7();
        
#if kIsAppStoreVersion
        
#define kTCLSalesDeviceUUID @"com.tcl.sales1.deviceuuid"
        NSString *uuid = [KeyChainHelper serviceForKey:kTCLSalesDeviceUUID];
        if (!uuid)
        {
            // 从iColund上获取
#define kTCLSalesICloudID @"6B9QBVNT2K.com.tcl.sales1"
//            NSUbiquitousKeyValueStore *cloudStore = [NSUbiquitousKeyValueStore defaultStore];
//            
//            uuid = [cloudStore stringForKey:kTCLSalesICloudID];
//            if (!uuid)
//            {
                uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
                [KeyChainHelper addService:uuid withKey:kTCLSalesDeviceUUID];
//                
//                // TODO:测试去同步
//                [cloudStore setString:uuid forKey:kTCLSalesDeviceUUID];
//                [cloudStore synchronize];
//            }
        }
        _deviceUUID = [uuid copy];

#else
        _deviceUUID = [@"460030766529870" copy];
#endif
        _navigationHeight = _isIOS7 ? 44.0f : 44.0;
	}
	return self;
}


@end
