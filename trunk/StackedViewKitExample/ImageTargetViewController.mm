//
//  ImageTargetViewController.m
//  onToi
//
//  Created by Nuke on 01/07/13.
//  Copyright (c) 2013 Peter Steinberger. All rights reserved.
//

#import "ImageTargetsAppDelegate.h"
#import "ImageTargetsQCARutils.h"
#import "ImageTargetViewController.h"
#import "PSStackedView.h"

@interface ImageTargetViewController ()

@end

@implementation ImageTargetViewController

static BOOL firstTime = YES;

@synthesize indexNumber, indexNumberLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.width = PSIsIpad() ? 400 : 150;

    
    // ImageTarget App Delegate
    ImageTargetsQCARutils *qUtils = [ImageTargetsQCARutils getInstance];
    qUtils.deviceOrientationLock = DeviceOrientationLockAuto;
    
//    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGRect screenBounds = self.view.bounds;
//    window = [[UIWindow alloc] initWithFrame: screenBounds];
    
    // Provide a list of targets we're expecting - the first in the list is the default
    [qUtils addTargetName:@"Stones & Chips" atPath:@"StonesAndChips.xml"];
    [qUtils addTargetName:@"Tarmac" atPath:@"Tarmac.xml"];
    [qUtils addTargetName:@"UIA" atPath:@"UIA.xml"];
    
    // Add the EAGLView and the overlay view to the window
//    arParentViewController = [[ImageTargetsParentViewController alloc] initWithWindow:window];
//    arParentViewController.arViewRect = screenBounds;
//    window.rootViewController = arParentViewController;
//    [window makeKeyAndVisible];
    
    arParentViewController = [[ImageTargetsParentViewController alloc] init];
    arParentViewController.arViewRect = self.view.bounds;
//    window.rootViewController = arParentViewController;
    [self.view addSubview:arParentViewController.view];
//    [window makeKeyAndVisible];

    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setIndexNumber:(NSUInteger)anIndexNumber {
    self.indexNumberLabel.text = [NSString stringWithFormat:@"%d", anIndexNumber];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSStackedViewDelegate

- (NSUInteger)stackableMinWidth; {
    return 100;
}
@end
