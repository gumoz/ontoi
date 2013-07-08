//
//  ExampleViewController2.h
//  PSStackedViewExample
//
//  Created by Peter Steinberger on 7/14/11.
//  Copyright 2011 Peter Steinberger. All rights reserved.
//

#include "PSStackedViewDelegate.h"

@interface ScheduleViewController : UITableViewController <PSStackedViewDelegate> {
    NSUInteger indexNumber_;
    NSArray *horarios_;
}

@property(nonatomic, assign) NSUInteger indexNumber;
@property(nonatomic, retain) NSArray *horarios;

@end
