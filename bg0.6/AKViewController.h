//
//  AKViewController.h
//  bg0.6
//
//  Created by Ahmad Karim on 07/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>

@interface AKViewController : UIViewController<AVCaptureVideoDataOutputSampleBufferDelegate>{
    
    UIImage * imageToResize;
    UIImage * CropImage;
 
    UIImage * buffer;
    IBOutlet UIButton *NextScreenButtonOutlet;
    IBOutlet UIButton *CaptureButtonOutlet;
    IBOutlet UIButton *SwitchButtonOutlet;
    IBOutlet UIImageView *CameraScreenReplace;
    

    
    IBOutlet UIButton *OriginalbuttonOutlet;
    IBOutlet UIButton *ToonButtonOutlet;
    IBOutlet UIButton *CropButtonOutlet;
    IBOutlet UIImageView *MessagesViewController;
    
    BOOL ToonFilterActivated;
    BOOL OriginalImageSelected;
    BOOL isUsingFrontFacingCamera;
}
//BUffer

@property (weak, nonatomic) IBOutlet UIImageView *TestImage;

// Camera
@property (weak, nonatomic) IBOutlet UIImageView* cameraImageView;
@property (weak, nonatomic) IBOutlet UIImageView *CroppedImageView;
@property (strong, nonatomic) AVCaptureDevice* device;
@property (strong, nonatomic) AVCaptureSession* captureSession;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer* previewLayer;
@property (strong, nonatomic) UIImage* cameraImage;
@property (weak, nonatomic) UIView* CroppedView;
@property (strong, nonatomic)UIImage * CropImage;

@end
