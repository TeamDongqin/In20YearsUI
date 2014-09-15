//
//  ProcessViewController.h
//  In20YearsUi
//
//  Created by tcl-macpro on 14-9-14.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import "CommonBaseViewController.h"
#import "LXActivity.h"

@interface ProcessViewController : CommonBaseViewController<LXActivityDelegate>{
}
    //图片2进制路径
    @property (strong, nonatomic) NSString* filePath;
    @property (strong, nonatomic) UIImageView* contentImage;
    @property (strong, nonatomic) UIButton* processBtn;


@end
