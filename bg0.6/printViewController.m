//
//  printViewController.m
//  bg0.6
//
//  Created by Ahmad Karim on 07/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import "printViewController.h"

@interface printViewController ()

@end

@implementation printViewController
@synthesize resultView;


-(IBAction)print{
    
    
    // NSString *path = [[NSBundle mainBundle] pathForResource:@"marlboro" ofType:@"png"];
    
    //   NSData *myData = [NSData dataWithContentsOfFile: path];
    imagetoprint= UIImageJPEGRepresentation(newImage, 1.0);
    NSLog(@"\n\n\n=========Printed sucessfull OUT OF  loop");
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if(pic && [UIPrintInteractionController canPrintData: imagetoprint] ) {
         NSLog(@"\n\n\n=========Printed sucessfull in loop");
        
        pic.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        // printInfo.jobName = [path lastPathComponent];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        pic.printInfo = printInfo;
        pic.showsPageRange = YES;
        pic.printFormatter=[[UIViewPrintFormatter alloc] init];
        
        pic.printingItem = imagetoprint;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
            //self.content = nil;
           
            if (!completed && error) {
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }
        };
        [pic presentAnimated:YES completionHandler:completionHandler];
        
    }
    
    
    
    
}

-(IBAction)test{
    
    UIImageWriteToSavedPhotosAlbum(newImage, Nil, Nil, NULL);
    NSLog(@"TEST123");
    
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *bottomImage = [UIImage imageNamed:@"photo 2.png"]; //background image
    UIImage *image       = [UIImage imageNamed:@"photo 3.png"]; //foreground image
    UIImage *image1      = [UIImage imageNamed:@"photo 4.png"]; //foreground image
    UIImage *image2      = [UIImage imageNamed:@"photo 5.png"]; //foreground image
    
    
    
    // Use existing opacity as is
    [bottomImage drawInRect:CGRectMake(0,0,50,50)];
    
    // Apply supplied opacity if applicable
    [image drawInRect:CGRectMake(50,0,50,50) blendMode:kCGBlendModeNormal alpha:1];
    [image1 drawInRect:CGRectMake(0,50,50,50) blendMode:kCGBlendModeNormal alpha:1];
    [image2 drawInRect:CGRectMake(50,50,50,50) blendMode:kCGBlendModeNormal alpha:1];
   // text = @"raaaaaaaa!";
    UIColor *color = [ UIColor colorWithRed: (0.0f)  green: (0.0)  blue:(0.0f) alpha: 1.0f ];
    [color set];
    
    //[ text drawInRect:CGRectMake(0,0,550,550) withFont:[UIFont systemFontOfSize:50] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentLeft ];

    
   
    
    
    
   // UIImageWriteToSavedPhotosAlbum(newImage, Nil, Nil, NULL);
    
    
    
    resultView.frame = CGRectMake(0,0, 1024,786);
   
    

}

-(void)scaleup{
    _size+=10;
    NSLog(@"SIZE IS ==%d",_size);
    [resultView removeFromSuperview] ;
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    text=textField.text;
    [ text drawInRect:CGRectMake(0,0,550,550) withFont:[UIFont systemFontOfSize:_size] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentLeft ];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    resultView = [[UIImageView alloc] initWithImage:newImage];
    [self.view addSubview:resultView];
    UIGraphicsEndImageContext();
    
}
-(void)printText{
 
}

-(void)scaleDown{
    
    
    _size-=10;
    NSLog(@"SIZE IS ==%d",_size);
    [resultView removeFromSuperview] ;
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    text=textField.text;
    [ text drawInRect:CGRectMake(0,0,550,550) withFont:[UIFont systemFontOfSize:_size] lineBreakMode: UILineBreakModeWordWrap alignment: UITextAlignmentLeft ];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    resultView = [[UIImageView alloc] initWithImage:newImage];
    [self.view addSubview:resultView];
    UIGraphicsEndImageContext();
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    textField = nil;
    [super viewDidUnload];
}
@end
