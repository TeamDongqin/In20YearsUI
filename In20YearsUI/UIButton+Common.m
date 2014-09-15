//
//  UIButton+Common.m
//  TCLSales
//
//  Created by 陈耀武 on 14-1-17.
//  Copyright (c) 2014年 Insigma. All rights reserved.
//

#import "UIButton+Common.h"

@implementation UIButton (Common)

+ (instancetype)buttonWithTip:(NSString *)tip
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textColor = [UIColor whiteColor];
    button.titleLabel.font = [UIFont fontWithName:KcommonFont size:23];
    [button setTitle:tip forState:UIControlStateNormal];
    return button;
}

@end
