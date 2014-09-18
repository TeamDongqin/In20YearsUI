//
//  ProcessViewController.m
//  In20YearsUi
//
//  Created by tcl-macpro on 14-9-14.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import "ProcessViewController.h"
#import "DRNRealTimeBlurView.h"
#import "ShareViewController.h"
#import "ASProgressPopUpView.h"


@interface ProcessViewController ()<ASProgressPopUpViewDataSource>

@property (nonatomic, strong) ASProgressPopUpView *progressView;
@property (nonatomic, strong) DRNRealTimeBlurView *blurView;
@property BOOL *doProgress;

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
    CGRect uploadImgframe = CGRectMake(40, 60, MainScreenWidth-80, MainScreenWidth-80);
    _contentImageView = [[UIImageView alloc] initWithFrame:uploadImgframe];
    //NSData *image = [NSData dataWithContentsOfFile:_filePath];
    //UIImage *uploadImg = [UIImage imageWithData:image];
    
    //self.contentImageView.image = uploadImg;
    self.contentImageView.image = [UIImage imageNamed:@"camera"];
    //加在视图中
    [self.view addSubview:_contentImageView];
    
    //add progress view
    self.progressView = [[ASProgressPopUpView alloc] initWithFrame:CGRectMake(40, MainScreenWidth+40, MainScreenWidth-80, 10)];
    self.progressView.popUpViewCornerRadius = 12.0;
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:24];
    self.progressView.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];
    [self.view addSubview:_progressView];
    
    
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
    self.doProgress = YES;
    [self.view addSubview:_processBtn];
    
    
    UIButton *reUploadBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    reUploadBtn.frame = CGRectMake(40, MainScreenHeight-50, MainScreenWidth-80, 40);
    reUploadBtn.backgroundColor =  [UIColor whiteColor];
    [reUploadBtn.layer setMasksToBounds:YES];
    [reUploadBtn.layer setCornerRadius:5.0];
    [reUploadBtn.layer setBorderWidth:1.0];//边框宽度
    [reUploadBtn.layer setBorderColor:CFBridgingRetain([UIColor blueColor])];//边框宽度
    [reUploadBtn setTitle:@"Redo" forState:UIControlStateNormal];
    [reUploadBtn addTarget:self action:@selector(onReUploadBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reUploadBtn];
    
    self.blurView = [[DRNRealTimeBlurView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight)];
    
    UILabel *shareTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 40, MainScreenWidth-80, 40)];
    shareTitleLabel.text = @"分享";
    /*shareTitleLabel.font = [UIFont fontWithName:@"Arial" size:35];
    shareTitleLabel.textColor = [UIColor blueColor];*/
    shareTitleLabel.textAlignment = UITextAlignmentCenter;
    //shareTitleLabel.backgroundColor = [UIColor clearColor];
    [self.blurView addSubview:shareTitleLabel];
    
    /*
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareBtn.frame = CGRectMake(40, 100, MainScreenWidth-80, 40);
    shareBtn.backgroundColor =  [UIColor clearColor];
    [shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    [self.blurView addSubview:shareBtn];*/
    
    UIButton *shareBtnLine = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    shareBtnLine.frame = CGRectMake(40, 90, MainScreenWidth-80, 2);
    shareBtnLine.backgroundColor =  [UIColor grayColor];
    //[shareBtn setTitle:@"Share" forState:UIControlStateNormal];
    [self.blurView addSubview:shareBtnLine];
    
    UIButton *fackbookBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fackbookBtn.frame = CGRectMake(40, 100, MainScreenWidth-80, 40);
    
    [fackbookBtn setBackgroundImage:[UIImage imageNamed:@"Facebook Button.png"] forState:UIControlStateNormal];
    //[fackbookBtn setTitle:@"Exit" forState:UIControlStateNormal];
    /*[fackbookBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];*/
    [self.blurView addSubview:fackbookBtn];
    
    UIButton *twitterBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    twitterBtn.frame = CGRectMake(40, 160, MainScreenWidth-80, 40);
    
    [twitterBtn setBackgroundImage:[UIImage imageNamed:@"Twitter Button.png"] forState:UIControlStateNormal];
    //[fackbookBtn setTitle:@"Exit" forState:UIControlStateNormal];
    /*[fackbookBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];*/
    [self.blurView addSubview:twitterBtn];
    
    UIButton *wechatBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    wechatBtn.frame = CGRectMake(40, 220, MainScreenWidth-80, 40);
    
    [wechatBtn setBackgroundImage:[UIImage imageNamed:@"WeChat Button.png"] forState:UIControlStateNormal];
    //[fackbookBtn setTitle:@"Exit" forState:UIControlStateNormal];
    /*[fackbookBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];*/
    [self.blurView addSubview:wechatBtn];
    
    UIButton *wechatFBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    wechatFBtn.frame = CGRectMake(40, 280, MainScreenWidth-80, 40);
    
    [wechatFBtn setBackgroundImage:[UIImage imageNamed:@"WeChat Friends Circle Button.png"] forState:UIControlStateNormal];
    //[fackbookBtn setTitle:@"Exit" forState:UIControlStateNormal];
    /*[fackbookBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];*/
    [self.blurView addSubview:wechatFBtn];
    
    
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    exitBtn.frame = CGRectMake(40, 380, MainScreenWidth-80, 40);
    exitBtn.backgroundColor =  [UIColor whiteColor];
    [exitBtn setTitle:@"Exit" forState:UIControlStateNormal];
    [exitBtn addTarget:self action:@selector(onShareExitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.blurView addSubview:exitBtn];
    self.blurView.alpha = 0.f;
    
    
    [self.view addSubview:self.blurView];
    
    
}

-(void)onProcessBtnClick{
    //click process btn
    [self.progressView showPopUpViewAnimated:YES];
    [self progress];
    [_processBtn setTitle:@"Cancel" forState:UIControlStateNormal];
    //[_processBtn performSelector:@selector(onProcessBtnClick) withObject:nil afterDelay:2];
    [_processBtn addTarget:self action:@selector(onCancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)onCancelBtnClick{
    if(self.doProgress){
        self.doProgress = NO;
    }else{
        self.doProgress = YES;
    }
}

-(void)onReUploadBtnClick
{
    //
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Timer

- (void)progress
{
    if (self.progressView.progress >= 1.0) {
        [_processBtn setTitle:@"Share" forState:UIControlStateNormal];
        [_processBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    float progress = self.progressView.progress;
    if (self.doProgress && progress < 1.0) {
        
        progress +=  0.02*(progress==0?0.1:progress)*10;
        
        [self.progressView setProgress:progress animated:YES];
        
        [NSTimer scheduledTimerWithTimeInterval:0.05
                                         target:self
                                       selector:@selector(progress)
                                       userInfo:nil
                                        repeats:NO];
    }
    if(!self.doProgress){
        [_processBtn setTitle:@"Continue" forState:UIControlStateNormal];
        [_processBtn addTarget:self action:@selector(progress) forControlEvents:UIControlEventTouchUpInside];
    }
}

// by default ASProgressPopUpView precalculates the largest popUpView size needed
// it then uses this size for all values and maintains a consistent size
// if you want the popUpView size to adapt as values change then return 'NO'
- (BOOL)progressViewShouldPreCalculatePopUpViewSize:(ASProgressPopUpView *)progressView;
{
    return NO;
}

-(void)shareBtnClick{
    /*NSArray *shareButtonTitleArray = [[NSArray alloc] init];
    NSArray *shareButtonImageNameArray = [[NSArray alloc] init];
    
    if (1==1) {
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信",@"微信朋友圈",@"Twitter"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22",@"sns_icon_23",@"sns_icon_11"];
    }
    
    LXActivity *lxActivity = [[LXActivity alloc] initWithTitle:@"分享到社交平台" delegate:self cancelButtonTitle:@"取消" ShareButtonTitles:shareButtonTitleArray withShareButtonImagesName:shareButtonImageNameArray];
    [lxActivity showInView:self.view];*/
    
    /*self.blurView.alpha = 1.0f;
    
    ShareViewController * modalView = [[ShareViewController alloc]init];
    modalView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    modalView.modalPresentationStyle = UIModalPresentationFormSheet;// 窗口
    
    // [self presentModalViewController:modalView animated:YES];  ios 6 弃用了该方法
    [self presentViewController:modalView animated:YES completion:^(void){
        modalView.view.superview.backgroundColor = [UIColor clearColor];// 背景色透明
    }];*/
    
    self.blurView.alpha = 1.0f;
    

}

-(void)onShareExitBtnClick
{
    self.blurView.alpha = 0.f;
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



- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    //CGRect uploadImgframe = CGRectMake(40, 60, MainScreenWidth-80, MainScreenWidth-80);
    //self.contentImage.view.frame = uploadImgframe;
    //self.contentImage = [self imageWithImage:self.contentImage scaledToSize:CGSizeMake(60, 80)];
    //NSData *image = [NSData dataWithContentsOfFile:_filePath];
    //UIImage *uploadImg = [UIImage imageWithData:image];
    self.contentImageView.image = self.contentImage;
    //self.contentImageView.image = _mainImage;
    //加在视图中
    //[self.view addSubview:_contentImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
