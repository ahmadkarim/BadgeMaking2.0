//
//  MainViewController.h
//  bg0.6
//
//  Created by Ahmad Karim on 08/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIPrintInteractionControllerDelegate,UITextFieldDelegate>{
    
    IBOutlet UIImageView *previewView;
    IBOutlet UIImageView *YellowBase;
    IBOutlet UIImageView *baseColor;
    
    IBOutlet UIView *textView;
    IBOutlet UIView *baseColorView;
    IBOutlet UIView *firstView;
    IBOutlet UIView *GraphicsView;
    IBOutlet UIView *ColorView;
   
    
    IBOutlet UILabel *baseViewLABEL;
    
    IBOutlet UIImageView *baseViewCOLOR;
    IBOutlet UIImageView *baseViewINSTRUMENT;
    
    UIImage * baseImage;
    UIImage * instrumentImage;
    UIImage * previewImage;
    
    NSData * imagetoprint;
    NSString *text;
    
    UIImage * baseYellow;
    UIImage * baseBlue;
    UIImage * baseRed;
    UIImage * baseWhite;
    
    UIImage * DhoolImage;
    UIImage * FluteImage;
    UIImage * GuitarImage;
    UIImage * KeyboardImage;
    
    
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

@property (strong, nonatomic) IBOutlet UIImageView *baseColor;
@property (strong, nonatomic) IBOutlet UIView * baseColorView;

- (IBAction)lastSegue;

- (IBAction)ResetButton;

- (IBAction)Color;
- (IBAction)Graphics;
- (IBAction)TEXT;
- (IBAction)OK;
- (IBAction)Prints;
- (IBAction)Preview;
//***********COLOR layer buttons***************
- (IBAction)yellowButton;
- (IBAction)whiteButton;
- (IBAction)redButton;
- (IBAction)blueButton;
- (IBAction)okColorLayer;
- (IBAction)printColorLayer;
- (IBAction)previewColorLayer;
//************GraphicsLayer*****************
- (IBAction)okGraphics;
- (IBAction)printGraphics;
- (IBAction)previewGraphics;

- (IBAction)Guitar;
- (IBAction)Keyboard;
- (IBAction)Flute;
- (IBAction)Dhool;
//************************TextView**************
- (IBAction)okText;





@end
