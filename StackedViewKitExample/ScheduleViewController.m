//
//  ExampleViewController2.m
//  PSStackedViewExample
//
//  Created by Peter Steinberger on 7/14/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"

#import "ProfesorViewController.h"
#import "ScheduleViewController.h"

@implementation ScheduleViewController

@synthesize indexNumber = indexNumber_;
@synthesize horarios = horarios_;

- (id)initWithStyle:(UITableViewStyle)style {
    if ((self = [super initWithStyle:style])) {
        
//        // random color
//        self.view.backgroundColor = [UIColor colorWithRed:((float)rand())/RAND_MAX green:((float)rand())/RAND_MAX blue:((float)rand())/RAND_MAX alpha:1.0];
        
        horarios_ = [NSArray arrayWithObjects:
                     @"7:00 - 9:00 Clase Moya",
                     @"9:00 - 11:00 Clase Gustavo",
                     @"11:00 - 13:00 Clase Aaron",
                     @"13:00 - 15:00 Clase nuke que no es nuke",
                     @"15:00 - 17:00 No hay clase",
                     nil];
        
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.width = PSIsIpad() ? 450 : 100;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.horarios.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Example2Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
	cell.textLabel.text = [self.horarios objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
    UIViewController<PSStackedViewDelegate> *viewController;

    viewController = [[ProfesorViewController alloc] initWithNibName:@"ProfesorViewController" bundle:nil];
    
    
    
    [XAppDelegate.stackController pushViewController:viewController fromViewController:self animated:YES];
    ((ProfesorViewController *)viewController).indexNumber = [[XAppDelegate.stackController viewControllers] count] - 1;
    ((ProfesorViewController *)viewController).indiceHorario = indexPath.row;
    
}

- (void)setIndexNumber:(NSUInteger)anIndexNumber {
    indexNumber_ = anIndexNumber;
    [self.tableView reloadData];
}



///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - PSStackedViewDelegate

- (NSUInteger)stackableMinWidth; {
    return 100;
}


@end
