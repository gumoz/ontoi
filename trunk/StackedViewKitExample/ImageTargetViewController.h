//
//  ImageTargetViewController.h
//  onToi
//
//  Created by Nuke on 01/07/13.
//  Copyright (c) 2013 Peter Steinberger. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "PSStackedViewDelegate.h"
#import "ImageTargetsParentViewController.h"

@interface ImageTargetViewController : UIViewController <PSStackedViewDelegate>
{
    UIWindow* window;
    ImageTargetsParentViewController* arParentViewController;
    UIImageView *splashV;
}
@property(nonatomic, strong) IBOutlet UILabel *indexNumberLabel;
@property(nonatomic, assign) NSUInteger indexNumber;
@end
