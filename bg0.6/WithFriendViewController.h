//
//  WithFriendViewController.h
//  bg2.0
//
//  Created by Ahmad Karim on 11/08/2014.
//  Copyright (c) 2014 Ahmad Karim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>

@interface WithFriendViewController : UIViewController<
UIPrintInteractionControllerDelegate,UITextFieldDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>{
    
    
    
    
    //==================CAMERA STUFF=================
    
    UIImage * imageToResize;
    UIImage * CropImage;
    
    UIImage * buffer;
    IBOutlet UIImageView *CameraScreenReplace;
    
    
    
    
    BOOL ToonFilterActivated;
    BOOL OriginalImageSelected;
    BOOL isUsingFrontFacingCamera;
    
    
    //===============================================
    
    
    
    IBOutlet UIImageView *previewView;
    IBOutlet UIImageView *YellowBase;
    IBOutlet UIImageView *baseColor;
    
    UIImage * previewImage;
    
    NSData * imagetoprint;
    NSString *text;
    
 
    CGRect printableRect;
    CGRect printableGrafixRect;
    CGRect printableText;
    
    CGRect baseRect;
    
    int _colorTag;
    int _instrumentTag;
    float _x,_y,_xforText,_yforText;
    int rectX,rectY,rectForTextX,rectForTextY;
    CGFloat newScale,labelNewScale;
    int rectScale,labelRectScale,fontScale;
    
    BOOL touchEnabled,textTouchEnabled;
    
    IBOutlet UITextField *textField;
    
    IBOutlet UITextField *textFeildDifferent;
    NSTimer * timer;
    
    
}

//==========================CAMERA Properties========


@property (weak, nonatomic) IBOutlet UIImageView *TestImage;

// Camera
@property (weak, nonatomic) IBOutlet UIImageView* cameraImageView;
@property (weak, nonatomic) IBOutlet UIImageView *CroppedImageView;
@property (strong, nonatomic) AVCaptureDevice* device;
@property (strong, nonatomic) AVCaptureSession* captureSession;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer* previewLayer;
@property (strong, nonatomic) UIImage* cameraImage;
@property (weak, nonatomic) UIView* CroppedView;
//@property (strong, nonatomic)UIImage * CropImage;





//===================================================

@end
