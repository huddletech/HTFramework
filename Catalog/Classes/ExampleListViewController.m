//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ExampleListViewController.h"
#import "ExampleTableItem.h"


@implementation ExampleListViewController

- (void)viewWillAppear:(BOOL)animated 
{
	// you can provide a list of items as either:
	
	// an array of strings
	//self.list = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
	
	// an array objects which implement the TableItemDisplay protocol
	ExampleTableItem *item1 = [ExampleTableItem tableItemWithName:@"X"];
	ExampleTableItem *item2 = [ExampleTableItem tableItemWithName:@"Y"];
	ExampleTableItem *item3 = [ExampleTableItem tableItemWithName:@"Z"];
	self.list = [NSArray arrayWithObjects:item1, item2, item3, nil];
	
	// AbstractGenericViewController has Save and Cancel buttons by default, but since
	// we're showing a static list here there's no need for them
	self.hideSaveButton = YES;
	self.hideCancelButton = YES;
	[super viewWillAppear:animated];
}

@end
