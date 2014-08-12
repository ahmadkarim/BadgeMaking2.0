//
//  MainViewController.m
//  bg0.6
//
//  Created by Ahmad Karim on 08/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//
//
#import "MainViewController.h"
#import "PreviewScreenViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize baseColor;
@synthesize baseColorView;

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
    
    [self setupCamera];
    
        [textView removeFromSuperview  ];
    [textField removeFromSuperview];
    
    
    UIPinchGestureRecognizer *pinchRecognizer =[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
    [self.view addGestureRecognizer:pinchRecognizer];
    self->textField.delegate=self;//making self a delegate of uitextfield
    
    // default values for scale
    fontScale=23;
    newScale=1;
    labelNewScale=1;
   
}

- (IBAction)pinchDetected:(UIGestureRecognizer *)sender {
    
    CGFloat scale = [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity =[(UIPinchGestureRecognizer *)sender velocity];
    
   // NSString *resultString = [[NSString alloc] initWithFormat: @"Pinch - scale = %f, velocity = %f",scale, velocity];
    
    NSLog(@"Pinch - scale = %f, velocity = %f",scale, velocity);

    if (touchEnabled) {
        if ( (scale > 0.8) && (scale < 1.165) ) {
            newScale = scale;
           CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
            baseViewINSTRUMENT.transform = transform;
             self.cameraImageView.transform=transform;
        }
    }
    
    if (textTouchEnabled) {
        if ( (scale > 0.8) && (scale < 1.565) ) {
            labelNewScale = scale;
            CGAffineTransform transform = CGAffineTransformMakeScale(labelNewScale,labelNewScale);
            baseViewLABEL.transform = transform;
        }
    }
    
    
}

- (IBAction)ZoomIn:(UIButton *)sender {
    
    newScale += 0.1 ;
    CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
    self.cameraImageView.transform=transform;
}

- (IBAction)ZoomOut:(UIButton *)sender {
    
    newScale -= 0.1 ;
    CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
    self.cameraImageView.transform=transform;
}


- (IBAction)LeftButton:(UIButton *)sender {
    
    _x -= 10;
    
    self.cameraImageView.center=CGPointMake(_x,self.cameraImageView.center.y);
}

- (IBAction)RightButton:(UIButton *)sender {
    _x += 10;
    
    self.cameraImageView.center=CGPointMake(_x,self.cameraImageView.center.y);
    
}

- (IBAction)UpButton:(UIButton *)sender {
    
    _y -= 10;
    
    self.cameraImageView.center=CGPointMake(self.cameraImageView.center.x,_y);
    NSLog(@"%f",self.cameraImageView.center.x);
}

- (IBAction)DownButton:(UIButton *)sender {
    
    _y += 10;
    
    self.cameraImageView.center=CGPointMake(self.cameraImageView.center.x,_y);
}

- (IBAction)AddTextBUtton:(UIButton *)sender {
    
    textField.hidden=NO;
    [self.view addSubview:textField];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight));
}

- (IBAction)lastSegue {
    NSLog(@" LAST SEGWAY CALLED    ");
    [self performSegueWithIdentifier: @"MySegue" sender: self];
}

- (IBAction)ResetButton {
    
    [baseViewLABEL removeFromSuperview];
    [baseViewINSTRUMENT removeFromSuperview];
    [baseViewCOLOR removeFromSuperview];
    [previewView removeFromSuperview];
    
    [baseViewINSTRUMENT setImage:Nil];
        [baseViewCOLOR setImage:Nil];
        [baseViewLABEL setText:Nil];
    text=Nil;
    textField.text=Nil;
    
    
    UIGraphicsEndImageContext();
    
    
}



- (IBAction)TEXT {
   
    if (_colorTag==3 || _colorTag==4) {
        textField.textColor=[UIColor whiteColor];
        
    }else{
        textField.textColor=[UIColor blackColor];
        
    }
    
    [baseViewLABEL removeFromSuperview];
    [firstView removeFromSuperview];
    //[baseColor removeFromSuperview];
     [self.view addSubview:textView];
    
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    //[self.view addSubview:baseViewLABEL];
    [self.view addSubview:textField];
    //textField.backgroundColor = [UIColor redColor];
}



- (IBAction)Prints {
    
    NSLog(@"Print Called");
    
    //////////////////////////////////////////////////////////////
    _xforText=baseViewLABEL.frame.origin.x - 345;
    _yforText=baseViewLABEL.frame.origin.y - 131;
    rectForTextX=(_xforText + 50) * 0.90;
    rectForTextY=(_yforText + 50) * 0.90;
    
    labelRectScale=labelNewScale *135;
    fontScale=labelNewScale * 25;
    //////////////////////////////////////////////////////////////

    
    CGSize newSize = CGSizeMake(1024,768);
    
    UIGraphicsBeginImageContext( newSize );
    
    
    
   // UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0);

      baseRect=CGRectMake(235, 140, 200, 200);
    
    printableRect=CGRectMake(rectX,rectY,rectScale,rectScale);
    printableGrafixRect=CGRectMake(400,275, 240, 220);
    printableText=CGRectMake((rectForTextX-20), rectForTextY+50, labelRectScale,labelRectScale);//CGRectMake(rectForTextX+50, rectForTextY+50, 136*.65, 36*.65);
    
    //printableText=CGRectMake(0, 50, 200, 200);
    
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self.cameraImageView.image CGImage], baseRect);
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
     CGRect  printableRect1=CGRectMake(50,50, 300, 300);
    
 //   [self.cameraImageView.image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    
     [image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    
    
    //Atributes for string
 /*
    NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    textStyle.lineBreakMode = NSLineBreakByWordWrapping;
    textStyle.alignment = NSTextAlignmentCenter;
 
    
  NSDictionary *dictionary = @{ NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:fontScale ] ,
                                NSParagraphStyleAttributeName:textStyle
                                ,NSForegroundColorAttributeName:[UIColor whiteColor] };
    
    [text drawInRect:printableText withAttributes:dictionary];
*/
    
 
    [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter ];

    
  
     buffer= UIGraphicsGetImageFromCurrentImageContext();
     
    
    UIGraphicsEndImageContext();
    
    
 /*    //   [GuitarImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
     //   [KeyboardImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
     //   [FluteImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];

      //  [DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    

      //  CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        

       // CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        
  
    
    
    
  //  [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode:UILineBreakModeWordWrap alignment: UITextAlignmentCenter ];


    //[template  drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    //[DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    
 //   previewImage=UIGraphicsGetImageFromCurrentImageContext();
    
   // [previewView setImage:previewImage];
   //  [self.view addSubview:previewView];
    
 //   UIGraphicsEndImageContext();
    // NSLog(@"\n\n\n=========Printed sucessfull in loop");
    
  //  imagetoprint=image;
    
    */
    imagetoprint= UIImageJPEGRepresentation(buffer, 1.0);
   
 /*
    // UIImage * newImage;//=[UIImage imageWithData:imagetoprint scale:0.50];
    //newImage=[baseImage ]
    //CIImage * image;//=CFBridgingRelease(CFBridgingRetain(baseImage));
   
   // baseImage=[UIImage imageWithCGImage:[baseImage CGImage] scale:0.2 orientation:UIImageOrientationUp];
  //  imagetoprint= UIImageJPEGRepresentation(previewImage, 1.0);
    
  //  newImage=[UIImage imageWithCIImage:image scale:0.5 orientation:UIImageOrientationUp];
  //  NSData * imagetpPrinttemp=UIImageJPEGRepresentation(newImage, 1.0);
  */
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    
    if(pic && [UIPrintInteractionController canPrintData: imagetoprint] ) {
        
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
                NSLog(@"FAILED! due to error in domain %@ with error code %ld", error.domain, (long)error.code);
            }else{
                NSLog(@"\n\n\n=========Printed sucessfull in loop");
                timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(lastSegue) userInfo:nil repeats:NO];
               
            }
        };
        [pic presentAnimated:YES completionHandler:completionHandler];
        
    }
    
   
     
    
    
}





-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   UITouch *touch=[[event allTouches]anyObject];
    if (touchEnabled) {
    
    CGPoint location = [touch locationInView:touch.view];
   
        location.y=location.x ;//+ (322-249);
        location.x=location.y - 20;//+ (315-171);
     NSLog(@"====x=%2f======y=%2f===",location.x,location.y);
        if (newScale>=1.10) {
            if(    (location.x > 465 && location.x < 501 )   && (location.y  < 368  &&  location.y > 288  )  ){
            baseViewINSTRUMENT.center=location;
            NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
             }
        }else{
            
            if(    (location.x > 435 && location.x < 555 )   && (location.y  < 398  &&  location.y > 240  )  ){
                baseViewINSTRUMENT.center=location;
                NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
            }
        }
       
    }// handling the movement of Graphics
    
    // for handling the movementof text
   
    if (textTouchEnabled) {
        
    
    
    CGPoint locationForText = [touch locationInView:touch.view];
    
    locationForText.x +=218.00;
    locationForText.y +=101.00;
    if(    (locationForText.x > 393 && locationForText.x < 641 )   && (locationForText.y  < 400 &&  locationForText.y > 140  )  ){
        baseViewLABEL.center=locationForText;
        NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
    }
    
    //baseViewLABEL.center=locationForText;
    NSLog(@"\nbaseviewLabel X=%2f-----baseviewLabel Y=%2f--",baseViewLABEL.frame.origin.x,baseViewLABEL.frame.origin.y);
    NSLog(@"\nlocationX= %2f ----- locationY= %2f----",locationForText.x,locationForText.y);

    }
}



- (IBAction)Preview {
    
    
    //////////////////////////////////////////////////////////////
    _xforText=baseViewLABEL.frame.origin.x - 345;
    _yforText=baseViewLABEL.frame.origin.y - 131;
    rectForTextX=(_xforText + 50) * 0.90;
    rectForTextY=(_yforText + 50) * 0.90;
    
    labelRectScale=labelNewScale *135;
    fontScale=labelNewScale * 25;
    //////////////////////////////////////////////////////////////
    
    UIImage * template=[UIImage imageNamed:@"squareCircle.png"];
    CGSize newSize = CGSizeMake(1024,768);
   
    UIGraphicsBeginImageContext( newSize );
  //  CGContextRef  context = UIGraphicsGetCurrentContext();
   
    baseRect=CGRectMake(235, 140, 200, 200);
    printableRect=CGRectMake(rectX,rectY,rectScale,rectScale);
    printableGrafixRect=CGRectMake(350,225, 240, 220);
    printableText=CGRectMake(rectForTextX-20, rectForTextY, labelRectScale,labelRectScale);//136*.65, 36*.65);//(0, 50, 136, 36);
    
   
    CGImageRef imageRef = CGImageCreateWithImageInRect([self.cameraImageView.image CGImage], baseRect);
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
 /*  // CGRect  printableRect=CGRectMake(0,0, 200, 200);
    
      //  [baseYellow drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    //    [baseWhite drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    //    [baseRed drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    //    [baseBlue drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    
    
    
      //  [GuitarImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
//        [KeyboardImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
//        [FluteImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
//        [DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    

     //   CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        

    //    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        
    
    
    
    
 //   [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode:
     
//     UILineBreakModeWordWrap alignment: UITextAlignmentCenter ];
    //[template  drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    //[DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
 */
    
    CGRect  printableRect1=CGRectMake(50,50, 300, 300);
    
   // [self.cameraImageView.image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [template drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    
    
    
    [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter ];
    
    
    
  //  buffer= UIGraphicsGetImageFromCurrentImageContext();
    
    previewImage=UIGraphicsGetImageFromCurrentImageContext();
    
    [previewView setImage:previewImage];
    [self.view addSubview:previewView];
    
    UIGraphicsEndImageContext();
    
    
}





- (void)viewDidUnload {
    UIGraphicsEndImageContext();
    YellowBase = nil;
    firstView = nil;
    ColorView = nil;
    GraphicsView = nil;
    baseColor = nil;
    [self setBaseColor:nil];
    baseColorView = nil;
    textView = nil;
    textField = nil;
    baseViewLABEL = nil;
    baseViewINSTRUMENT = nil;
    baseViewCOLOR = nil;
    previewView = nil;
    textFeildDifferent = nil;
    [super viewDidUnload];
}





- (IBAction)okText {
   // resigning first responder
    [textField resignFirstResponder];

      //NSLog(@"\nbaseviewLabel X=%2f-----baseviewLabel Y=%2f--",baseViewLABEL.frame.origin.x,baseViewLABEL.frame.origin.y);
    [textView removeFromSuperview];
    

    
   text=textField.text;
   baseViewLABEL.text=text;
    
 //baseImage=UIGraphicsGetImageFromCurrentImageContext();
    //baseColor=[[UIImageView alloc ]initWithImage:baseImage];
   //[self.view addSubview:baseColor ];
  
    [textField removeFromSuperview];
    
     [self.view addSubview:firstView];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
// adjustment of text
    
    
    _xforText=baseViewLABEL.frame.origin.x - 395;
    _yforText=baseViewLABEL.frame.origin.y - 281;
    rectForTextX=(_xforText + 50) * 0.90;
    rectForTextY=(_yforText + 50) * 0.90;
    
    labelRectScale=labelNewScale *135;
    fontScale=labelNewScale * 25;
// no adjustment allowed now
    textTouchEnabled=NO;
    

 //   [self textFieldShouldEndEditing:textField];
    NSLog(@"OK TEXT");
    
}


- (IBAction)OK {
    
   // [textField resignFirstResponder];

    
}


-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"DONE EDITING");
    textTouchEnabled=YES;
    [self DoneEditing];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
   NSLog(@"Begin EDITING");
    textTouchEnabled=NO;

    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField_l
{
    [textField_l resignFirstResponder];
    return YES;
}


-(void)DoneEditing{
    
    text=textField.text;
    baseViewLABEL.text=text;
    [textField removeFromSuperview];
    [self.view addSubview:baseViewLABEL];
  
    if (_colorTag==3 || _colorTag==4) {
        baseViewLABEL.textColor=[UIColor whiteColor];
        
    }else{
        baseViewLABEL.textColor=[UIColor blackColor];
        
    }
    
}

//===================================CAMERA =======================
- (void)setupCamera
{
    NSArray* devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for(AVCaptureDevice *device in devices)
    {
        if([device position] == AVCaptureDevicePositionBack)
            self.device = device;
    }
    
    AVCaptureDeviceInput* input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    AVCaptureVideoDataOutput* output = [[AVCaptureVideoDataOutput alloc] init];
    output.alwaysDiscardsLateVideoFrames = YES;
    
    dispatch_queue_t queue;
    queue = dispatch_queue_create("cameraQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
    
    NSString* key = (NSString *) kCVPixelBufferPixelFormatTypeKey;
    NSNumber* value = [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA];
    NSDictionary* videoSettings = [NSDictionary dictionaryWithObject:value forKey:key];
    [output setVideoSettings:videoSettings];
    
    self.captureSession = [[AVCaptureSession alloc] init];
    [self.captureSession addInput:input];
    [self.captureSession addOutput:output];
    [self.captureSession setSessionPreset:AVCaptureSessionPresetPhoto];
    
    //  NSString *const AVCaptureSessionPreset352x288;
    _captureSession.sessionPreset = AVCaptureSessionPreset640x480;
    
    self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    
    // CHECK FOR YOUR APP
    self.previewLayer.frame = CGRectMake(192,52, 640 , 480);
    
    
    self.previewLayer.connection.videoOrientation=AVCaptureVideoOrientationLandscapeRight;
    
    
    
    /*
     ///// menu layer ontop of the cameraview layer
     CALayer *theLayer = [CALayer layer];
     //  [[[self view] layer] addSublayer:theLayer];
     theLayer.contents = (id)[[UIImage imageNamed:@"camera screen black.png"] CGImage];
     theLayer.contentsCenter = CGRectMake(0.0f, 0.0f, 300.0f, 1024);
     theLayer.bounds = CGRectMake(200.0f, 0.0f, 768.0f, 1024.0f);
     theLayer.position = self.view.center;
     //  theLayer.contentsScale = 5.0f;
     ////////////////////////////////////
     */
    
    /*  CALayer *HW = [CALayer layer];
     //   [[[self view]layer]addSublayer:HW];
     HW.contents = (id)[[UIImage imageNamed:@"face outline.png"]CGImage];
     HW.contentsCenter = CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f);
     HW.bounds = CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f);
     HW.position = CGPointMake(385, 508);
     
     */
    
    /*
     CALayer *redband = [CALayer layer];
     //   [[[self view]layer]addSublayer:redband];
     redband.contents = (id)[[UIImage imageNamed:@"left red band.png"]CGImage];
     redband.contentsCenter = CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f);
     redband.bounds = CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f);
     redband.position = CGPointMake(384, 510);
     */
    [self.view.layer insertSublayer:self.previewLayer atIndex:1];   // Comment-out to hide preview layer
    //  [self.view.layer insertSublayer:theLayer above:self.previewLayer];
    //  [self.view.layer insertSublayer:HW above:self.previewLayer];
    //  [self.view.layer insertSublayer:redband above:self.previewLayer];
    
    
    [self.captureSession startRunning];
}

- (IBAction)Capture:(id)sender {
    
    /*  CIImage* image = [CIImage imageWithCGImage:(__bridge CGImageRef)(self.cameraImage)];
     CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace
     context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
     NSArray* features = [detector featuresInImage:image];
     
     for(CIFaceFeature* faceFeature in features)
     {
     UIView* faceView = [[UIView alloc] initWithFrame:faceFeature.bounds];
     faceView.layer.borderWidth = 1;
     faceView.layer.borderColor = [[UIColor redColor] CGColor];
     //    [self.cameraImage addSubview:faceView];
     
     // CGRect biggerRectangle = CGRectInset(faceFeature.bounds, 200, 200);
     // CGImageRef imageRef = CGImageCreateWithImageInRect((__bridge CGImageRef)(image) , biggerRectangle);
     
     // cropping the face
     CGImageRef imageRef = CGImageCreateWithImageInRect((__bridge CGImageRef)(image), faceFeature.bounds);
     [self.cameraImageView setImage:[UIImage imageWithCGImage:imageRef]];
     CGImageRelease(imageRef);
     }*/
    

    
//    UIImage *cameraScreenReplace = [UIImage imageNamed:@"camera screen new.png"];
//    [CameraScreenReplace setImage:cameraScreenReplace];
//    
   
    [self.captureSession stopRunning];
   
    
    CGRect A=CGRectMake(192,52, 640 , 480);
    self.cameraImageView.image = self.cameraImage;
    self.cameraImageView.frame=A;
   // self.cameraImageView.image = self.cameraImage;
    // self.TestImage.image=self.cameraImage;
    
    NSLog(@"%f , %f",self.cameraImage.size.height,self.cameraImage.size.width);
    
    _cameraImageView.userInteractionEnabled = YES;
    
    /*   UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
     [cameraImageView addGestureRecognizer:panRecognizer];
     
     UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer  alloc] initWithTarget:self action:@selector(pinchDetected:)];
     [cameraImageView addGestureRecognizer:pinchRecognizer];   */
    
   // CGSize newSize = CGSizeMake(1024,768);
    
  //  UIGraphicsBeginImageContext( newSize );
//CGContextRef  context = UIGraphicsGetCurrentContext();
    
  //  CGRect baseRect=CGRectMake(450, 450, 300, 300);
    
    // [self.cameraImage drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
  //  CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
 //   self.TestImage.image=UIGraphicsGetImageFromCurrentImageContext();
    
    // [previewView setImage:previewImage];
    //  [self.view addSubview:previewView];
    
    if (self.cameraImageView.image==NULL) {
        NSLog(@"self.cameraimageview is NULL");
    }else{
        
        NSLog(@"Is not Null");
    }
    
    
    
    _x = self.cameraImageView.center.x;
    _y=self.cameraImageView.center.y;
    
    UIGraphicsEndImageContext();
}


- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CVPixelBufferLockBaseAddress(imageBuffer,0);
    uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(imageBuffer);
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    CGImageRef newImage = CGBitmapContextCreateImage(newContext);
    
    CGContextRelease(newContext);
    CGColorSpaceRelease(colorSpace);
    
    self.cameraImage = [UIImage imageWithCGImage:newImage scale:1.0f orientation:UIImageOrientationUp];
    
    CGImageRelease(newImage);
    
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
}




//=================================================================


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    PreviewScreenViewController * Pvc = [segue destinationViewController];
    Pvc.previewImage=buffer;
    
    // Pass the selected object to the new view controller.
}

@end
