//
//  ZCQRScanViewController.m
//  ZCProject
//
//  Created by Leven on 15/11/17.
//  Copyright (c) 2015年 Leven. All rights reserved.
//

#import "ZCQRScanViewController.h"

// 扫一扫功能属于AV框架里面的
#import <AVFoundation/AVFoundation.h>

@interface ZCQRScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>

//  扫一扫的会话层
@property (nonatomic,strong)AVCaptureSession *session;

// 扫描的视图层,以视频录像的方式展现
@property (nonatomic,strong)AVCaptureVideoPreviewLayer *previewLayer;

@end

@implementation ZCQRScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self QRsanf];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 二维码扫一扫功能代码
- (void)QRsanf{

    // 初始化设备样式
    AVCaptureDevice *device=[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error;
    
    // 初始化输入流
    AVCaptureDeviceInput *input=[[AVCaptureDeviceInput alloc]initWithDevice:device error:&error];
    
    if (error) {
        // 通常的错误是 无设备可用
        NSLog(@"%@",error);
        return;
    }
    
    // 定义数据输出流
    AVCaptureMetadataOutput *output=[[AVCaptureMetadataOutput alloc]init];
    
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 会话
    AVCaptureSession *session=[[AVCaptureSession alloc]init];
    
    // 把输入输出流添加到会话上面
    [session addInput:input];
    [session addOutput:output];
    
    // 设置输出扫描的对象为二维码
    [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];

    
    // 视频类型的视图扫描,把会话添加到视频视图里面
    AVCaptureVideoPreviewLayer *preView=[[AVCaptureVideoPreviewLayer alloc]initWithSession:session];
    // 把视频类型的layer 添加到我的视图控制器上面,添加到最上层
    preView.frame=self.view.layer.frame;
    [self.view.layer insertSublayer:preView above:0];
    
    //开始会话
    [session startRunning];
    
    self.session=session;
    self.previewLayer=preView;
    
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{

    // 找到扫描得到的数据里面的设备数据
    AVMetadataMachineReadableCodeObject *objec=metadataObjects.firstObject;
    
    NSLog(@"%@",objec.stringValue);
    
    
    if(self.session){
        // 停止扫描会话
        [self.session stopRunning];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:objec.stringValue]];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
   
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
