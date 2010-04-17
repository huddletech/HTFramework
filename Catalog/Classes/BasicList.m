//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BasicList.h"
#import "ExampleTableItem.h"


@implementation BasicList

- (void)viewWillAppear:(BOOL)animated 
{
	// you can provide a list of items as either:
	
	// an array of strings
	//self.list = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
	
	// an array objects which implement the TableItemDisplay protocol
	ExampleTableItem *item1 = [ExampleTableItem tableItemWithName:@"X"];
	ExampleTableItem *item2 = [ExampleTableItem tableItemWithName:@"Y"];
	ExampleTableItem *item3 = [ExampleTableItem tableItemWithName:@"Z"];
	self.items = [NSArray arrayWithObjects:item1, item2, item3, nil];
	
	TableSection *section2 = [[TableSection alloc] init];
	section2.title = @"Numbers";
	section2.items = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
	[self.sections addObject:section2];
	[section2 release];
	
	// AbstractGenericViewController has Save and Cancel buttons by default, but since
	// we're showing a static list here there's no need for them

	[super viewWillAppear:animated];
}

@end
