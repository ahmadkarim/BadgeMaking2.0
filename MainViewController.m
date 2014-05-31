//
//  MainViewController.m
//  bg0.6
//
//  Created by Ahmad Karim on 08/10/2012.
//  Copyright (c) 2012 Ahmad Karim. All rights reserved.
//
// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfhv// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh// blbalkfadfj;afjkasfhaskljfasklfjafhjkadfhakljfhaslkfjaklfhaslkjfhakljfklafafhkldfhalkfklasfakslfh
#import "MainViewController.h"

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
    [ColorView removeFromSuperview];
    [GraphicsView removeFromSuperview];
    [textView removeFromSuperview  ];
    [textField removeFromSuperview];
    
    [self.view addSubview:baseColorView];
    
    baseImage=[UIImage imageNamed:@"White_Display_Badge.png"];
    [baseColor setImage:baseImage];
    
    baseYellow=[UIImage imageNamed:@"yellow.png"];
    baseRed=[UIImage imageNamed:@"red.png"];
    baseBlue=[UIImage imageNamed:@"blue.png"];
    baseWhite=[UIImage imageNamed:@"white.png"];
    
    DhoolImage=[UIImage imageNamed:@"dholak_Printable1.png"];
    FluteImage=[UIImage imageNamed:@"Flute_Printable.png"];
    GuitarImage=[UIImage imageNamed:@"Guitar_Printable.png"];
    KeyboardImage=[UIImage imageNamed:@"Music_KeyBoard_Printable.png"];
    
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

- (IBAction)Color {
   //UIImage * image =[UIImage imageNamed:@"Interface_Yellow2.png"];
   // [YellowBase setImage:image];
    NSLog(@"in COLOR");
    [firstView removeFromSuperview];
    [GraphicsView removeFromSuperview];
    [self.view addSubview:ColorView];
   // [self.view addSubview:baseColor ];

    
    
}

- (IBAction)Graphics {
    
    [firstView removeFromSuperview];
   // baseImage=UIGraphicsGetImageFromCurrentImageContext();
   // baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    
    [self.view addSubview:GraphicsView];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
   //  [self.view addSubview:baseColor ];
    touchEnabled=YES;

   
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
    
    CGSize newSize = CGSizeMake(1024,768);
    
    UIGraphicsBeginImageContext( newSize );
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    baseRect=CGRectMake(50, 50, 200, 200);
    printableRect=CGRectMake(rectX+50,rectY+50,rectScale,rectScale);
    printableGrafixRect=CGRectMake(400,275, 240, 220);
    printableText=CGRectMake((rectForTextX-20)+50, rectForTextY+50, labelRectScale,labelRectScale);//CGRectMake(rectForTextX+50, rectForTextY+50, 136*.65, 36*.65);
    
    //printableText=CGRectMake(0, 50, 200, 200);
    
    // CGRect  printableRect=CGRectMake(0,0, 200, 200);
    
    if (_colorTag==1) {
        [baseYellow drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_colorTag==2){
        [baseWhite drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }else if (_colorTag==3){
        [baseRed drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }else if (_colorTag==4){
        [baseBlue drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }
    
    
    if (_instrumentTag==1) {
        [GuitarImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==2){
        [KeyboardImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==3){
        [FluteImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==4){
        [DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }
    
    if (_colorTag==3 || _colorTag==4) {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        
    }else{
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        
    }
    
    
    
    [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode:
     
     UILineBreakModeWordWrap alignment: UITextAlignmentCenter ];
    //[template  drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    //[DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    previewImage=UIGraphicsGetImageFromCurrentImageContext();
    
   // [previewView setImage:previewImage];
   //  [self.view addSubview:previewView];
    
    UIGraphicsEndImageContext();
    // NSLog(@"\n\n\n=========Printed sucessfull in loop");
    
  //  imagetoprint=image;
   // imagetoprint= UIImageJPEGRepresentation(baseImage, 1.0);
   // UIImage * newImage;//=[UIImage imageWithData:imagetoprint scale:0.50];
    //newImage=[baseImage ]
    //CIImage * image;//=CFBridgingRelease(CFBridgingRetain(baseImage));
   
   // baseImage=[UIImage imageWithCGImage:[baseImage CGImage] scale:0.2 orientation:UIImageOrientationUp];
    imagetoprint= UIImageJPEGRepresentation(previewImage, 1.0);
    
  //  newImage=[UIImage imageWithCIImage:image scale:0.5 orientation:UIImageOrientationUp];
  //  NSData * imagetpPrinttemp=UIImageJPEGRepresentation(newImage, 1.0);
    
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
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }else{
                NSLog(@"\n\n\n=========Printed sucessfull in loop");
                timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(lastSegue) userInfo:nil repeats:NO];
               
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
   
        location.x=location.x ;//+ (322-249);
        location.y=location.y - 20;//+ (315-171);
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
    if(    (locationForText.x > 373 && locationForText.x < 541 )   && (locationForText.y  < 431 &&  locationForText.y > 250  )  ){
        baseViewLABEL.center=locationForText;
        NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
    }
    
    //baseViewLABEL.center=locationForText;
    NSLog(@"\nbaseviewLabel X=%2f-----baseviewLabel Y=%2f--",baseViewLABEL.frame.origin.x,baseViewLABEL.frame.origin.y);
    NSLog(@"\nlocationX= %2f ----- locationY= %2f----",locationForText.x,locationForText.y);

    }
}



- (IBAction)Preview {
    
   // UIImage * template=[UIImage imageNamed:@"Badge_template.png"];
    CGSize newSize = CGSizeMake(1024,768);
   
    UIGraphicsBeginImageContext( newSize );
    CGContextRef  context = UIGraphicsGetCurrentContext();
   
    baseRect=CGRectMake(0, 0, 200, 200);
    printableRect=CGRectMake(rectX,rectY,rectScale,rectScale);
    printableGrafixRect=CGRectMake(350,225, 240, 220);
    printableText=CGRectMake(rectForTextX-20, rectForTextY, labelRectScale,labelRectScale);//136*.65, 36*.65);//(0, 50, 136, 36);
    
   // CGRect  printableRect=CGRectMake(0,0, 200, 200);
    
    if (_colorTag==1) {
        [baseYellow drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_colorTag==2){
        [baseWhite drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }else if (_colorTag==3){
        [baseRed drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }else if (_colorTag==4){
        [baseBlue drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
        
    }
    
    
    if (_instrumentTag==1) {
        [GuitarImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==2){
        [KeyboardImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==3){
        [FluteImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }else if (_instrumentTag==4){
        [DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    }
    
    if (_colorTag==3 || _colorTag==4) {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        
    }else{
        CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
        
    }
    
    
    
    [ text drawInRect:printableText withFont:[UIFont fontWithName:@"Helvetica" size:fontScale ] lineBreakMode:
     
     UILineBreakModeWordWrap alignment: UITextAlignmentCenter ];
    //[template  drawInRect:baseRect blendMode:kCGBlendModeNormal alpha:1.0];
    //[DhoolImage drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1.0];
    
    previewImage=UIGraphicsGetImageFromCurrentImageContext();
    
    [previewView setImage:previewImage];
    [self.view addSubview:previewView];
    
    UIGraphicsEndImageContext();
    
    
}

- (IBAction)yellowButton {
    NSLog(@"in COLOR");
   baseImage=[UIImage imageNamed:@"Yellow_Display_Badge.png"];
   [baseViewCOLOR setImage:baseImage];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    
  //  [baseYellow drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
  //  baseImage=UIGraphicsGetImageFromCurrentImageContext();
  //  baseColor=[[UIImageView alloc ]initWithImage:baseImage];
  //  [self.view addSubview:baseColor ];
    _colorTag=1;
    
}

- (IBAction)whiteButton {
    NSLog(@"in COLOR");
    baseImage=[UIImage imageNamed:@"White_Display_Badge.png"];
    [baseViewCOLOR setImage:baseImage];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    
   // [baseWhite drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
   // baseImage=UIGraphicsGetImageFromCurrentImageContext();
   // baseColor=[[UIImageView alloc ]initWithImage:baseImage];
   // [self.view addSubview:baseColor ];
    _colorTag=2;
}

- (IBAction)redButton {
    NSLog(@"in COLOR");
    baseImage=[UIImage imageNamed:@"Red_Display_Badge.png"];
    [baseViewCOLOR setImage:baseImage];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    
  //  [baseRed drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
 //   baseImage=UIGraphicsGetImageFromCurrentImageContext();
  //  baseColor=[[UIImageView alloc ]initWithImage:baseImage];
 //   [self.view addSubview:baseColor ];
    _colorTag=3;
}

- (IBAction)blueButton {
    NSLog(@"in COLOR");
    baseImage=[UIImage imageNamed:@"Blue_Display_Badge.png"];
    [baseViewCOLOR setImage:baseImage];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    
    
 //   [baseBlue drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
 //   baseImage=UIGraphicsGetImageFromCurrentImageContext();
//    baseColor=[[UIImageView alloc ]initWithImage:baseImage];
 //   [self.view addSubview:baseColor ];
    _colorTag=4;
}



- (IBAction)printColorLayer {
    NSLog(@"in COLOR Print");
    
    /*
    imagetoprint= UIImageJPEGRepresentation(baseImage, 1.0);
    
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
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }
        };
        [pic presentAnimated:YES completionHandler:completionHandler];
        
    }
   
   */ 
}

- (IBAction)previewColorLayer {
    NSLog(@"in COLOR preview");
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


- (IBAction)printGraphics {
}

- (IBAction)previewGraphics {
}

- (IBAction)Guitar {
    
    instrumentImage=[UIImage imageNamed:@"Guitar_Printable.png"];
    [baseViewINSTRUMENT setImage:instrumentImage];
    _instrumentTag=1;
    
   //  NSString *path = [[NSBundle mainBundle] pathForResource:@"Guitar_Printable" ofType:@"png"];
   // UIImage  *myimg = [UIImage  imageWithContentsOfFile: path];
   
   // UIGraphicsEndImageContext();
   // CGSize newSize = CGSizeMake(1024,768);
   // UIGraphicsBeginImageContext( newSize );
    NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
    
    
 }

- (IBAction)Keyboard {
    instrumentImage=[UIImage imageNamed:@"Music_KeyBoard_Printable.png"];
    [baseViewINSTRUMENT setImage:instrumentImage];
    _instrumentTag=2;
    
    
   // [KeyboardImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
   
    /*
    UIGraphicsEndImageContext();
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    
    
    if (_colorTag==1) {
        [baseYellow drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [KeyboardImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==2) {
        [baseWhite drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [KeyboardImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==3) {
        [baseRed drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [KeyboardImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==4) {
        [baseBlue drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [KeyboardImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }
    
    
    
    baseImage=UIGraphicsGetImageFromCurrentImageContext();
    baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    [self.view addSubview:baseColor ];*/
    NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
}

- (IBAction)Flute {
    instrumentImage=[UIImage imageNamed:@"Flute_Printable.png"];
    [baseViewINSTRUMENT setImage:instrumentImage];
    _instrumentTag=3;
    
   // [FluteImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
 /*   UIGraphicsEndImageContext();
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    
    
    if (_colorTag==1) {
        [baseYellow drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [FluteImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==2) {
        [baseWhite drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [FluteImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==3) {
        [baseRed drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [FluteImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==4) {
        [baseBlue drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [FluteImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }
    
    
    
    baseImage=UIGraphicsGetImageFromCurrentImageContext();
    baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    [self.view addSubview:baseColor ];*/
    NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
}

- (IBAction)Dhool {
    instrumentImage=[UIImage imageNamed:@"dholak_Printable1.png"];
    [baseViewINSTRUMENT setImage:instrumentImage];
    _instrumentTag=4;
    
 //   [DhoolImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
  /*  UIGraphicsEndImageContext();
    CGSize newSize = CGSizeMake(1024,768);
    UIGraphicsBeginImageContext( newSize );
    
    
    if (_colorTag==1) {
        [baseYellow drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [DhoolImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==2) {
        [baseWhite drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [DhoolImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==3) {
        [baseRed drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [DhoolImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }else if (_colorTag==4) {
        [baseBlue drawInRect:printableRect blendMode:kCGBlendModeNormal alpha:1];
        [DhoolImage drawInRect:printableGrafixRect blendMode:kCGBlendModeNormal alpha:1];
    }
    
    
    
    baseImage=UIGraphicsGetImageFromCurrentImageContext();
    baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    [self.view addSubview:baseColor ];*/
    NSLog(@"\nbaseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
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
- (IBAction)okColorLayer {
    [ColorView removeFromSuperview];
    [self.view addSubview:firstView];
    
    // baseImage=UIGraphicsGetImageFromCurrentImageContext();
    //  baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    //  [self.view addSubview:baseColor ];
    
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    
    
    
    NSLog(@"in COLOR ok");
}
- (IBAction)okGraphics {
    
    NSLog(@"\n **OK** baseview X=%2f-----baseview Y=%2f-- ",baseViewINSTRUMENT.frame.origin.x,baseViewINSTRUMENT.frame.origin.y);
    
    [GraphicsView removeFromSuperview];
    
    // baseImage=UIGraphicsGetImageFromCurrentImageContext();
    // baseColor=[[UIImageView alloc ]initWithImage:baseImage];
    // [self.view addSubview:baseColor ];
    
    
    [self.view addSubview:firstView];
    [self.view addSubview:baseViewCOLOR];
    [self.view addSubview:baseViewINSTRUMENT];
    [self.view addSubview:baseViewLABEL];
    touchEnabled=NO;
    
    _x=baseViewINSTRUMENT.frame.origin.x - 353;
    _y=baseViewINSTRUMENT.frame.origin.y - 234;
    NSLog(@"difference X=%2f  Y=%2f ",_x,_y);
    rectX=_x;
    rectY=_y;
    NSLog(@"%d,%d",rectX,rectY);
    
    rectScale=newScale * 200;
    NSLog(@"SCALE==%d===",rectScale);
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





@end
