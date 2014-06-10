//
//  AKViewController.m
//  bg0.6
//
//  Created by Ahmad Karim on 07/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//

#import "AKViewController.h"

@interface AKViewController ()

@end

@implementation AKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupCamera];
    NSLog(@"setup camera called");
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"Segue called");
    
    
}


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
    self.previewLayer.frame = CGRectMake(0,0, 300 , 400);
    

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
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];   // Comment-out to hide preview layer
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
    
    ToonButtonOutlet.hidden = NO;
    OriginalbuttonOutlet.hidden = NO;
    NextScreenButtonOutlet.enabled = YES;
    
    UIImage *cameraScreenReplace = [UIImage imageNamed:@"camera screen new.png"];
    [CameraScreenReplace setImage:cameraScreenReplace];
    
    [self.captureSession stopRunning];
    
    CGRect A=CGRectMake(300, 0, 300, 400);
    // self.cameraImageView.image = self.cameraImage;
    self.cameraImageView.frame=A;
    self.cameraImageView.image = self.cameraImage;
   // self.TestImage.image=self.cameraImage;
    
    NSLog(@"%f , %f",self.cameraImage.size.height,self.cameraImage.size.width);
    
    _cameraImageView.userInteractionEnabled = YES;
    
    /*   UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
     [cameraImageView addGestureRecognizer:panRecognizer];
     
     UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer  alloc] initWithTarget:self action:@selector(pinchDetected:)];
     [cameraImageView addGestureRecognizer:pinchRecognizer];   */
    
    CGSize newSize = CGSizeMake(1024,768);
    
    UIGraphicsBeginImageContext( newSize );
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    CGRect baseRect=CGRectMake(450, 450, 300, 300);
    
   // [self.cameraImage drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    self.TestImage.image=UIGraphicsGetImageFromCurrentImageContext();
    
    // [previewView setImage:previewImage];
    //  [self.view addSubview:previewView];
    
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

@end
