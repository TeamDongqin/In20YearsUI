//
//  ProcessViewController.m
//  In20YearsUi
//
//  Created by tcl-macpro on 14-9-14.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import "ProcessViewController.h"

@interface ProcessViewController ()

@end

@implementation ProcessViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        //btn.frame = CGRectMake(100, 100, 100, 100);
        //[btn setTitle:@"获取图片" forState:UIControlStateNormal];
        //[self.view addSubview:btn];
        
        
        
        /*self.processBtn = [UIButton buttonWithTip:@"Process"];
        [_processBtn addTarget:self action:@selector(onProcessBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_processBtn];*/
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor yellowColor];
    CGRect uploadImgframe = CGRectMake(40, MainScreenHeight/2-MainScreenWidth/2+20, MainScreenWidth-80, MainScreenWidth-80);
    self.contentImage = [[UIImageView alloc] initWithFrame:uploadImgframe];
    NSData *image = [NSData dataWithContentsOfFile:_filePath];
    UIImage *uploadImg = [UIImage imageWithData:image];
    
    self.contentImage.image = uploadImg;
    //self.contentImage.image = _mainImage;
    //加在视图中
    [self.view addSubview:_contentImage];
    
    
    self.processBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _processBtn.frame = CGRectMake(40, MainScreenHeight-100, MainScreenWidth-80, 40);
    _processBtn.backgroundColor =  [UIColor whiteColor];
    [_processBtn.layer setMasksToBounds:YES];
    [_processBtn.layer setCornerRadius:5.0];
    [_processBtn.layer setBorderWidth:1.0];//边框宽度
    [_processBtn.layer setBorderColor:CFBridgingRetain([UIColor blueColor])];//边框宽度
    [_processBtn setTitle:@"Process" forState:UIControlStateNormal];
    //[_processBtn performSelector:@selector(onProcessBtnClick) withObject:nil afterDelay:2];
    [_processBtn addTarget:self action:@selector(onProcessBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_processBtn];
}

-(void)onProcessBtnClick{
    //click process btn
    [_processBtn setTitle:@"Share" forState:UIControlStateNormal];
    [_processBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)shareBtnClick{
    NSArray *shareButtonTitleArray = [[NSArray alloc] init];
    NSArray *shareButtonImageNameArray = [[NSArray alloc] init];
    
    if (1==1) {
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信",@"微信朋友圈",@"Twitter"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22",@"sns_icon_23",@"sns_icon_11"];
    }
    
    LXActivity *lxActivity = [[LXActivity alloc] initWithTitle:@"分享到社交平台" delegate:self cancelButtonTitle:@"取消" ShareButtonTitles:shareButtonTitleArray withShareButtonImagesName:shareButtonImageNameArray];
    [lxActivity showInView:self.view];

}

#pragma mark - LXActivityDelegate

- (void)didClickOnImageIndex:(NSInteger *)imageIndex
{
    NSLog(@"%d",(int)imageIndex);
}

- (void)didClickOnCancelButton
{
    NSLog(@"didClickOnCancelButton");
}


//配置控件坐标
- (void)layoutOnIPhone
{
    /*[_processBtn sizeWith:CGSizeMake(MainScreenWidth-80, 50)];
     [_processBtn layoutBelow:_contentImage margin:5];
     [_processBtn layoutParentHorizontalCenter];*/
}

//配置背景信息
- (void)configBackground
{
    self.backgroundView.image = [UIImage imageNamed:@"UI.png"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
