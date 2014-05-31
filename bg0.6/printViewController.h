//
//  printViewController.h
//  bg0.6
//
//  Created by Ahmad Karim on 07/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface printViewController : UIViewController<UIPrintInteractionControllerDelegate>{
    
    IBOutlet UIImageView *resultView;
    
    UIImage * newImage;
    NSData * imagetoprint;
    NSString *text;
    int _size;
    IBOutlet UITextField *textField;

}
@property (strong, nonatomic) IBOutlet UIImageView *resultView;
-(IBAction)print;
-(IBAction)test;
-(IBAction)scaleup;
-(IBAction)printText;
-(IBAction)scaleDown;
@end
