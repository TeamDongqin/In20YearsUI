//
//  ViewController.m
//  In20YearsUi
//
//  Created by tcl-macpro on 14-9-11.
//  Copyright (c) 2014年 com.teamdongqin. All rights reserved.
//

#import "ViewController.h"
#import "ProcessViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //set backgroud color
    //self.view.backgroundColor = [UIColor redColor];
    //set background image
    UIImageView *bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"UI.png"]];
    bgView.frame = self.view.bounds;
    [self.view addSubview:bgView];
    //add upload button
    CGRect uploadBtnframe = CGRectMake(MainScreenWidth/2-25, MainScreenHeight/2-25, 51, 51);
    //UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *uploadBtn = [[UIButton alloc] initWithFrame:uploadBtnframe];
    //uploadBtn.backgroundColor = [UIColor whiteColor];
    //[uploadBtn setTitle:@"上传" forState:UIControlStateNormal];
    [uploadBtn setBackgroundImage:[UIImage imageNamed:@"camera.png"] forState:UIControlStateNormal];
    [uploadBtn addTarget:self action:@selector(openMenu) forControlEvents:UIControlEventTouchUpInside];
    //uploadBtn.frame = uploadBtnframe;
    [self.view addSubview:uploadBtn];
    
}

-(void)openMenu
{
    //在这里呼出下方菜单按钮项
    myActionSheet = [[UIActionSheet alloc]
                     initWithTitle:nil
                     delegate:self
                     cancelButtonTitle:@"取消"
                     destructiveButtonTitle:nil
                     otherButtonTitles: @"打开照相机", @"从手机相册获取",nil];
    
    [myActionSheet showInView:self.view];
    //[myActionSheet release];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //呼出的菜单按钮点击后的响应
    if (buttonIndex == myActionSheet.cancelButtonIndex)
    {
        NSLog(@"取消");
    }
    
    switch (buttonIndex)
    {
        case 0:  //打开照相机拍照
            [self takePhoto];
            break;
            
        case 1:  //打开本地相册
            [self LocalPhoto];
            break;
    }
}

//开始拍照
-(void)takePhoto
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        //设置拍照后的图片可被编辑
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        //[picker release];
        [self presentModalViewController:picker animated:YES];
    }else
    {
        NSLog(@"模拟其中无法打开照相机,请在真机中使用");
    }
}

//打开本地相册
-(void)LocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:picker animated:YES];
    //[picker release];
}

/*
-(void)uploadBtnClick{
    UIApplication *myApp = [UIApplication sharedApplication];
    [myApp setStatusBarHidden:YES];//先把状态栏隐藏起来
    
	UIImagePickerController *picker = [[UIImagePickerController alloc]init];//创建
    picker.delegate = self;//设置为托
    picker.view.frame=CGRectMake(0, 0, 320, 460);//重绘大小与位置
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//图像来源
    picker.allowsEditing=YES;//允许编辑图片
    [self.view addSubview:picker.view];//添加到当前窗口
}*/

//当选择一张图片后进入这里
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{
    NSLog(@"您选择了图片");
    //关闭相册界面
    [picker dismissModalViewControllerAnimated:YES];
    
    /*添加处理选中图像代码*/
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"])
    {
        NSLog(@"开始把图片转成NSData");
        //先把图片转成NSData
        
        /*NSData *data;
        if (UIImagePNGRepresentation(image) == nil)
        {
            data = UIImageJPEGRepresentation(image, 1.0);
        }
        else
        {
            data = UIImagePNGRepresentation(image);
        }
        
        
        NSLog(@"开始把图片存到沙盒");
        //图片保存的路径
        //这里将图片放在沙盒的documents文件夹中
        NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        
        
        //文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        //把刚刚图片转换的data对象拷贝至沙盒中 并保存为image.png
        [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:@"/image.png"] contents:data attributes:nil];
        
        NSLog(@"开始读取图片路径");
        
        //得到选择后沙盒中图片的完整路径
        filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,  @"/image.png"];
        */
        
        ProcessViewController *processViewController = [[ProcessViewController alloc] init];
        //processViewController.filePath = filePath;
        processViewController.contentImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        NSLog(@"开始跳转到ProgressViewController");
        [self.navigationController pushViewController:processViewController animated:YES];

    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    /*添加代码，处理选中图像又取消的情况*/
    [picker dismissModalViewControllerAnimated:YES];//退出照相机
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


@end
