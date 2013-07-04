//
//  AppDelegate.m
//  onToi
//
//  Created by Gumoz.
//  Copyright 2013. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuRootController.h"


// http://sacalamoya.com/ws/index.php/alumno/datosAlumno

@interface AppDelegate ()
@property (nonatomic, strong) PSStackedViewController *stackController;
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize stackController = stackController_;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions; {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor]; // really should be default
    
    // set root controller as stack controller
    MenuRootController *menuController = [[MenuRootController alloc] init];
    self.stackController = [[PSStackedViewController alloc] initWithRootViewController:menuController];

    // test to disable large inset
    //self.stackController.largeLeftInset = self.stackController.leftInset;

    self.window.rootViewController = self.stackController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
