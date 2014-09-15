//
//  ViewController.h
//  In20YearsUi
//
//  Created by tcl-macpro on 14-9-11.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : CommonBaseViewController<UITextViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    
    //下拉菜单
    UIActionSheet *myActionSheet;
    
    //图片2进制路径
    NSString* filePath;
    
}

@end
