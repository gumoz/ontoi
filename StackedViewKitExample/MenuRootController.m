//
//  ExampleMenuRootController.m
//  PSStackedViewExample
//
//  Created by Peter Steinberger on 7/18/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import "PSStackedView.h"
#import "AppDelegate.h"
#import "MenuTableViewCell.h"
#import "MenuRootController.h"
#import "WelcomeViewController.h"
#import "ScheduleViewController.h"
#import "UIImage+OverlayColor.h"
#import "ImageTargetViewController.h"
#include <QuartzCore/QuartzCore.h>

#define kMenuWidth 200
#define kCellText @"CellText"
#define kCellImage @"CellImage" 

@interface MenuRootController()
@property (nonatomic, strong) UITableView *menuTable;
@property (nonatomic, strong) NSArray *cellContents;
@end

@implementation MenuRootController

@synthesize menuTable = menuTable_;
@synthesize cellContents = cellContents_;

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - NSObject



///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UIView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"load example view, frame: %@", NSStringFromCGRect(self.view.frame));
        
#if 0
    self.view.layer.borderColor = [UIColor greenColor].CGColor;
    self.view.layer.borderWidth = 2.f;
#endif
    
    // add example background
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
            
    // prepare menu content
    NSMutableArray *contents = [[NSMutableArray alloc] init];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"08-chat"], kCellImage, NSLocalizedString(@"Acerca",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"11-clock"], kCellImage, NSLocalizedString(@"Horarios",@""), kCellText, nil]];
    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"15-tags"], kCellImage, NSLocalizedString(@"Ubicación",@""), kCellText, nil]];
    
//    
//    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"08-chat"], kCellImage, NSLocalizedString(@"<- Collapse",@""), kCellText, nil]];
//    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"11-clock"], kCellImage, NSLocalizedString(@"Expand -"",@""), kCellText, nil]];
//    [contents addObject:[NSDictionary dictionaryWithObjectsAndKeys:[UIImage invertImageNamed:@"15-tags"], kCellImage, NSLocalizedString(@"Clear All",@""), kCellText, nil]];

    self.cellContents = contents;
    
    // add table menu
	UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kMenuWidth, self.view.height) style:UITableViewStylePlain];
    self.menuTable = tableView;
    
    self.menuTable.backgroundColor = [UIColor clearColor];
    self.menuTable.delegate = self;
    self.menuTable.dataSource = self;
    [self.view addSubview:self.menuTable];
    [self.menuTable reloadData];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [cellContents_ count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ExampleMenuCell";
    
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [[cellContents_ objectAtIndex:indexPath.row] objectForKey:kCellText];
	cell.imageView.image = [[cellContents_ objectAtIndex:indexPath.row] objectForKey:kCellImage];
	    
    //if (indexPath.row == 5)
    //    cell.enabled = NO;
    
    return cell;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {  
    PSStackedViewController *stackController = XAppDelegate.stackController;
    UIViewController*viewController = nil;
    
    
    if (indexPath.row < 3) {
        // Pop everything off the stack to start a with a fresh app feature
        // DISABLED FOR DEBUGGING
        //[stackController popToRootViewControllerAnimated:YES];
    }
    
    if (indexPath.row == 0) {
        viewController = [[WelcomeViewController alloc] initWithNibName:@"WelcomeViewController" bundle:nil];
        ((WelcomeViewController *)viewController).indexNumber = [stackController.viewControllers count];

        while ([stackController.viewControllers count]) {
            [stackController popViewControllerAnimated:YES];
        }
        
    }else if(indexPath.row == 1) {
        viewController = [[ScheduleViewController alloc] initWithStyle:UITableViewStylePlain];     
        ((ScheduleViewController *)viewController).indexNumber = [stackController.viewControllers count];
    }else if(indexPath.row == 2) { // Twitter style
        viewController = [[ImageTargetViewController alloc] initWithNibName:@"ImageTargetViewController" bundle:nil];
        ((WelcomeViewController *)viewController).indexNumber = [stackController.viewControllers count];
        viewController.view.width = roundf((self.view.width - stackController.leftInset)/2);
    }
    else if(indexPath.row == 3) {        
        [stackController collapseStack:1 animated:YES];
    }else if(indexPath.row == 4) { // right
        [stackController expandStack:1 animated:YES];
    }else if(indexPath.row == 5) {
        while ([stackController.viewControllers count]) {
            [stackController popViewControllerAnimated:YES];
        }
    }
    
    if (viewController) {
        [XAppDelegate.stackController pushViewController:viewController fromViewController:nil animated:YES];
    }
}

@end
