//
//  WithFriendViewController.m
//  bg2.0
//
//  Created by Ahmad Karim on 11/08/2014.
//  Copyright (c) 2014 Ahmad Karim. All rights reserved.
//

#import "WithFriendViewController.h"

@interface WithFriendViewController ()

@end

@implementation WithFriendViewController

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
    
    checkForPrintButton=0;
    intForYLeft=0;
    intForYRight=0;
    
    [self setupCamera];
    

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
         //   baseViewINSTRUMENT.transform = transform;
            self.cameraImageView.transform=transform;
        }
    }
    
    if (textTouchEnabled) {
        if ( (scale > 0.8) && (scale < 1.565) ) {
            labelNewScale = scale;
            CGAffineTransform transform = CGAffineTransformMakeScale(labelNewScale,labelNewScale);
            //baseViewLABEL.transform = transform;
        }
    }
    
    
}

- (IBAction)ZoomIn:(UIButton *)sender {
    
    if (checkForPrintButton==1) {
        
        newScale += 0.1 ;
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
        leftCrop.transform=transform;
        
    }else if (checkForPrintButton==2){
        
         newScale += 0.1 ;
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
        rightCrop.transform=transform;
        
        
    }
}

- (IBAction)ZoomOut:(UIButton *)sender {
    
   
    
    if (checkForPrintButton==1) {
        
        newScale -= 0.1 ;
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
        leftCrop.transform=transform;
        
    }else if (checkForPrintButton==2){
        
         newScale -= 0.1 ;
        CGAffineTransform transform = CGAffineTransformMakeScale(newScale,newScale);
        rightCrop.transform=transform;
        
        
    }
    
    
    
    
}


- (IBAction)LeftButton:(UIButton *)sender {
    
    if (checkForPrintButton==1) {
        
        _x -= 10;
        leftCrop.center=CGPointMake(_x,leftCrop.center.y);
        
    }else if (checkForPrintButton==2){
        
        
        _x1 -= 10;
        rightCrop.center=CGPointMake(_x1,rightCrop.center.y);
        
        
    }
    
    
    
    
 //   self.cameraImageView.center=CGPointMake(_x,self.cameraImageView.center.y);
}

- (IBAction)RightButton:(UIButton *)sender {
    
    if (checkForPrintButton==1) {
        
        _x += 10;
        leftCrop.center=CGPointMake(_x,leftCrop.center.y);
        
    }else if (checkForPrintButton==2){
        
        
        _x1 += 10;
        rightCrop.center=CGPointMake(_x1,rightCrop.center.y);
        
        
    }
    
//    _x += 10;
//    self.cameraImageView.center=CGPointMake(_x,self.cameraImageView.center.y);
    
}

- (IBAction)UpButton:(UIButton *)sender {
    
  
    if (checkForPrintButton==1) {
            

    
        intForYLeft-=10;
        
        
         _y -= 10;
        leftCrop.center=CGPointMake(leftCrop.center.x,_y);
        
    }else if (checkForPrintButton==2){
        
        intForYRight-=10;
        
       _y1 -= 10;
        rightCrop.center=CGPointMake(rightCrop.center.x,_y1);
        
        
    }
    
    
    
//   
//    
//    self.cameraImageView.center=CGPointMake(self.cameraImageView.center.x,_y);
//    NSLog(@"%f",self.cameraImageView.center.x);
}

- (IBAction)DownButton:(UIButton *)sender {
    
    if (checkForPrintButton==1) {
        intForYLeft += 10;
        _y += 10;
        leftCrop.center=CGPointMake(leftCrop.center.x,_y);
        
    }else if (checkForPrintButton==2){
        
        intForYRight += 10;
        _y1 += 10;
        rightCrop.center=CGPointMake(rightCrop.center.x,_y1);
        
        
    }
    
//  self.cameraImageView.center=CGPointMake(self.cameraImageView.center.x,_y);
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






- (IBAction)Prints {
    
    NSLog(@"Print Called");
    
    //////////////////////////////////////////////////////////////
//    _xforText=baseViewLABEL.frame.origin.x - 345;
//    _yforText=baseViewLABEL.frame.origin.y - 131;
    rectForTextX=(_xforText + 50) * 0.90;
    rectForTextY=(_yforText + 50) * 0.90;
    
    labelRectScale=labelNewScale *135;
    fontScale=labelNewScale * 25;
    //////////////////////////////////////////////////////////////
    
    UIImage * template=[UIImage imageNamed:@"squareCircle.png"];
    UIImage * template1=[UIImage imageNamed:@"best friend.png"];

    CGSize newSize = CGSizeMake(1024,768);
    
    UIGraphicsBeginImageContext( newSize );
    
    
    
    // UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0);
    
 //   baseRect=CGRectMake(235, 140, 200, 200);
   
    baseRect=CGRectMake(265, 191, 300, 300);
    
    printableRect=CGRectMake(rectX,rectY,rectScale,rectScale);
    
    ////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////
    // REct for BEST FRIEND template"
    
    printableGrafixRect=CGRectMake(70,210, 205, 75);
    
    ////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////
    
    
    printableText=CGRectMake((rectForTextX-20), rectForTextY+50, labelRectScale,labelRectScale);//CGRectMake(rectForTextX+50, rectForTextY+50, 136*.65, 36*.65);
    
    //printableText=CGRectMake(0, 50, 200, 200);
    
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([mergedImage CGImage], baseRect);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    CGRect  printableRect1=CGRectMake(50,50, 250, 250);
    
    //   [self.cameraImageView.image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    
    [image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [template drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
      [template1 drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    
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
                //  timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(lastSegue) userInfo:nil repeats:NO];
                
            }
        };
        [pic presentAnimated:YES completionHandler:completionHandler];
        
    }
    
    
    
    
    
}


-(void)callLastSegue{
    
    
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
                //baseViewINSTRUMENT.center=location;
          //      NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
            }
        }else{
            
            if(    (location.x > 435 && location.x < 555 )   && (location.y  < 398  &&  location.y > 240  )  ){
            //    baseViewINSTRUMENT.center=location;
          //      NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,//baseViewINSTRUMENT.frame.origin.y);
            }
        }
        
    }// handling the movement of Graphics
    
    // for handling the movementof text
    
    if (textTouchEnabled) {
        
        
        
        CGPoint locationForText = [touch locationInView:touch.view];
        
        locationForText.x +=218.00;
        locationForText.y +=101.00;
        if(    (locationForText.x > 393 && locationForText.x < 641 )   && (locationForText.y  < 400 &&  locationForText.y > 140  )  ){
       //     baseViewLABEL.center=locationForText;
       //     NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
        }
        
        //baseViewLABEL.center=locationForText;
      //  NSLog(@"\nbaseviewLabel X=%2f-----baseviewLabel Y=%2f--",baseViewLABEL.frame.origin.x,baseViewLABEL.frame.origin.y);
     //   NSLog(@"\nlocationX= %2f ----- locationY= %2f----",locationForText.x,locationForText.y);
        
    }
}




- (void)viewDidUnload {
    UIGraphicsEndImageContext();
    YellowBase = nil;


    previewView = nil;
    textFeildDifferent = nil;
    [super viewDidUnload];
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"DONE EDITING");
    textTouchEnabled=YES;
//    [self DoneEditing];
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




- (IBAction)Preview {
    
    
    //////////////////////////////////////////////////////////////
    //  _xforText=baseViewLABEL.frame.origin.x - 345;
    //   _yforText=baseViewLABEL.frame.origin.y - 131;
    rectForTextX=(_xforText + 50) * 0.90;
    rectForTextY=(_yforText + 50) * 0.90;
    
    labelRectScale=labelNewScale *135;
    fontScale=labelNewScale * 25;
    //////////////////////////////////////////////////////////////
    
    UIImage * template=[UIImage imageNamed:@"squareCircle.png"];
    UIImage * template1=[UIImage imageNamed:@"best friend.png"];

    CGSize newSize = CGSizeMake(1024,768);
     UIGraphicsBeginImageContext( newSize );
    
    
    //  CGContextRef  context = UIGraphicsGetCurrentContext();
    

    baseRect=CGRectMake(265, 191, 300, 300);


   
    printableRect=CGRectMake(rectX,rectY,rectScale,rectScale);
       ////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////
        //Rect for BEST FRIEND TEMPLATE"
       printableGrafixRect=CGRectMake(75,330, 250, 100);
      ////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////
   
    printableText=CGRectMake(rectForTextX-20, rectForTextY, labelRectScale,labelRectScale);//136*.65, 36*.65);//(0, 50, 136, 36);
    
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([mergedImage CGImage], baseRect);

   
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
    
    CGRect  printableRect1=CGRectMake(50,150, 300, 300);
    
    // [self.cameraImageView.image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [template drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    
    [template1 drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    
    [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter ];
    
    
    
    //  buffer= UIGraphicsGetImageFromCurrentImageContext();
    
    previewImage=UIGraphicsGetImageFromCurrentImageContext();
    
    [previewView setImage:previewImage];
    [self.view addSubview:previewView];
    
    UIGraphicsEndImageContext();
    
    
}





- (IBAction)testMethod:(id)sender {
    
    if (checkForPrintButton==1) {
        NSLog(@" teset Method rect %d ",checkForPrintButton);
        baseRect=CGRectMake(0, 0, 320, 480);
        printableRect=CGRectMake(100,100, 320, 480);
        
    }else if (checkForPrintButton==2){
        
        NSLog(@" teset Method rect %d ",checkForPrintButton);
        baseRect=CGRectMake(320, 0, 320, 480);
        printableRect=CGRectMake(420,100, 320, 480);
        
    }
    
    
    
    CGSize newSize = CGSizeMake(1024,768);
    
    UIGraphicsBeginImageContext( newSize );
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([self.cameraImageView.image CGImage], baseRect);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    if (checkForPrintButton==1) {
        
        leftCrop.image=image;
    }else if (checkForPrintButton==2){
        
        rightCrop.image=image;
    }
    
    
    
    [image drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    
    if (checkForPrintButton==1) {
        NSLog(@" teset Method BBuffer %d ",checkForPrintButton);
        buffer= UIGraphicsGetImageFromCurrentImageContext();
        //  previewView.image=buffer;
    }else if (checkForPrintButton==2){
        NSLog(@" teset Method buffer %d ",checkForPrintButton);
        buffer1= UIGraphicsGetImageFromCurrentImageContext();
        //  previewView.image=buffer1;
    }
    
    
    UIGraphicsEndImageContext();
    
    
    
    previewView.hidden=NO;
    
}

//merge method
-(IBAction)Test2Method:(id)sender{
    
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    
    //Adjustment for X axis
    CGRect baseRectF1=CGRectMake(_x-100, intForYRight, 320, 480);
    ///////////////////////////////////////////////////////////
    CGRect baseRectF2=CGRectMake(_x1-320, 0, 320, 480);
    
    
    //Adjustment for X axis
    CGRect printableRect1=CGRectMake(_x-100 ,intForYLeft, 320, 480);
    ///////////////////////////////////////////////////////////

    CGRect printableRect2=CGRectMake(_x1-320 ,0, 320, 480);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([buffer CGImage], baseRectF1);
    CGImageRef imageRef2 = CGImageCreateWithImageInRect([buffer1 CGImage],baseRectF2);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    UIImage * image2 = [UIImage imageWithCGImage:imageRef2];
    
    CGImageRelease(imageRef);
    CGImageRelease(imageRef2);
    
    
    
    [image drawInRect:printableRect1 blendMode:kCGBlendModeNormal alpha:1.0];
    [image2 drawInRect:printableRect2 blendMode:kCGBlendModeNormal alpha:1.0];
    
    mergedImage=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    
    
    NSLog(@"--LeftCropImageX : %f ----LeftCropImageY : %f -- ",leftCrop.center.x,leftCrop.center.y);
    NSLog(@"--RightCropImageX : %f ----RightCropImageY : %f -- ",rightCrop.center.x,rightCrop.center.y);
    
    
    
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
    
    checkForPrintButton++;
    
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
    
    
    
    _x = leftCrop.center.x;
    _y = leftCrop.center.y;
    
    _x1=rightCrop.center.x;
    _y1=rightCrop.center.y;
    

    
    UIGraphicsEndImageContext();
    
    if (checkForPrintButton==2) {
         [self.captureSession stopRunning];
          }
    
     [self    testMethod:nil];
    
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
