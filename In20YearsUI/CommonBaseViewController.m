//
//  CommonBaseViewController.m
//  HKRemote
//
//  Created by James Chen on 2/28/13.
//  Copyright (c) 2013 ken liu. All rights reserved.
//

#import "CommonBaseViewController.h"
//#import "ReconciliationDeteailViewController.h"

@implementation CommonBaseViewController

- (instancetype)init
{
    if (self = [super init])
    {
        [self configParams];
    }
    
    return  self;
}

- (void)configParams
{
    
}

#pragma mark -
#pragma Rotate Methods

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self layoutOnViewWillAppear];
}
/*
 - (BOOL)shouldAutorotate
 {
 //    if ([self.navigationController.visibleViewController isKindOfClass:[ReconciliationDeteailViewController class]]) {
 //        return YES;
 //    }
 return NO;
 //    [self layoutSubviewsFrame];
 //
 //    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
 }
 
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
 {
 return [self shouldAutorotate];
 }
 
 -(NSUInteger)supportedInterfaceOrientations
 {
 //    return UIInterfaceOrientationPortrait;
 return UIInterfaceOrientationMaskAllButUpsideDown;
 }
 
 -(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
 {
 return UIInterfaceOrientationPortrait;
 }
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor flatWhiteColor];
    if ([IOSDeviceConfig sharedConfig].isIOS7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        
    }
    
    if ([self isAutoLayout])
    {
        [self autoLayoutOwnViews];
    }
    else
    {
        // IOS7相关处理
        
        [self addBackground];
        
        [self configBackground];
        
        
        // 在此外添加界面的各个控件
        [self addOwnViews];
        
        // 在此设置各个控件的值
        [self configOwnViews];
        
        // 对自身的控件进行设置区域
        [self layoutSubviewsFrame];
    }
}

- (void)addBackground
{
    _backgroundView = [[UIImageView alloc] init];
    [self.view addSubview:_backgroundView];
    //[_backgroundView release];
}

- (void)addOwnViews
{
    // 此处添加界面中的控件
    
}

- (void)configBackground
{
    //    _backgroundView.image = [UIImage imageNamed:@""];
}

- (void)configOwnViews
{
    // 此处配置界面中的控件的值
}

#pragma mark -
#pragma Layout Methods

- (void)layoutBackground
{
    _backgroundView.frame = self.view.bounds;
}

- (void)layoutOnIPhone
{
    // iPhone上的布局
}

- (void)layoutOnIPadInPortrait
{
    // iPad竖屏布局
    [self layoutOnIPhone];
}

- (void)layoutOnIPadInLandScape
{
    // iPad横屏布局
    [self layoutOnIPhone];
}

- (void)layoutSubviewsFrame
{
    //    CGFloat height = 0;
    //    height = [IOSDeviceConfig sharedConfig].isIOS7 ? 0 : 20;
    //    CGRect rect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - height);
    //    self.view.bounds = rect;
    if ([self isAutoLayout]) {
        return;
    }
    
    [self layoutBackground];
    // App 根据需求决定如何进行布局
    IOSDeviceConfig *app = [IOSDeviceConfig sharedConfig];
    
    if (app.isIPad)
    {
        if (app.isPortrait)
        {
            [self layoutOnIPadInPortrait];
        }
        else
        {
            [self layoutOnIPadInLandScape];
        }
    }
    else
    {
        [self layoutOnIPhone];
    }
}


- (void)layoutOnViewWillAppear
{
    [self layoutSubviewsFrame];
}

@end

@implementation CommonBaseViewController (AutoLayout)

// 是否支持autoLayout
- (BOOL)isAutoLayout
{
    return NO;
}

// 添加自动布局相关的constraints
- (void)autoLayoutOwnViews
{
    // 添加自动布局相关的内容
}

@end
