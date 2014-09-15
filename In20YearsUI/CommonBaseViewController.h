//
//  CommonBaseViewController.h
//  HKRemote
//
//  Created by James Chen on 2/28/13.
//  Copyright (c) 2013 ken liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonBaseViewController : UIViewController

@property (strong, nonatomic) UIImageView       *backgroundView;

- (void)configParams;

- (void)addBackground;

- (void)addOwnViews;

- (void)configBackground;

- (void)configOwnViews;

- (void)layoutBackground;

- (void)layoutOnViewWillAppear;

- (void)layoutOnIPhone;

- (void)layoutOnIPadInPortrait;

- (void)layoutOnIPadInLandScape;




@end

@interface CommonBaseViewController (AutoLayout)

// 是否支持autoLayout
- (BOOL)isAutoLayout;

// 添加自动布局相关的constraints
- (void)autoLayoutOwnViews;

@end