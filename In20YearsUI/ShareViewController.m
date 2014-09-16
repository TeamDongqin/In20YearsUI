//
//  ShareViewController.m
//  In20YearsUI
//
//  Created by tcl-macpro on 14-9-15.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.view.backgroundColor = [UIColor clearColor];
        
        
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shareBtn.frame = CGRectMake(40, 100, MainScreenWidth-80, 40);
        shareBtn.backgroundColor =  [UIColor whiteColor];
        [shareBtn setTitle:@"Share" forState:UIControlStateNormal];
        [self.view addSubview:shareBtn];
        
        UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        exitBtn.frame = CGRectMake(40, 180, MainScreenWidth-80, 40);
        exitBtn.backgroundColor =  [UIColor whiteColor];
        [exitBtn setTitle:@"Exit" forState:UIControlStateNormal];
        [exitBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:exitBtn];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
}

-(void)onShareExitBtnClick
{
    //self.blurView.alpha = 0.f;
    [self dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"back");//这里打个断点，点击按钮模态视图移除后会回到这里
        
        //ios 5.0以上可以用该方法
        
    }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
