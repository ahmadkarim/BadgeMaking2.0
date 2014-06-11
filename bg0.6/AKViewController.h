//
//  AKViewController.h
//  bg0.6
//
//  Created by Ahmad Karim on 07/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreVideo/CoreVideo.h>


@interface AKViewController : UIViewController{
    
    UIImage * imageToResize;
    UIImage * CropImage;
 
    UIImage * buffer;
    IBOutlet UIButton *NextScreenButtonOutlet;
    IBOutlet UIButton *CaptureButtonOutlet;
    IBOutlet UIButton *SwitchButtonOutlet;
    IBOutlet UIImageView *CameraScreenReplace;
    

}


@end
