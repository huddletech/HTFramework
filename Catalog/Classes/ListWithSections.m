//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "ListWithSections.h"
#import "ExampleTableItem.h"


@implementation ListWithSections

- (void)viewDidLoad{

	// All tableviews contain at least one section. By default, items are added
	// to the first section.
	
	self.items = [NSArray arrayWithObjects:@"X", @"Y", @"Z", nil];
	
	// A TableSection object is just a collection of items, along with an optional title
	
	TableSection *numbersSection = [self addSectionWithTitle:@"Numbers"];
	
	NSArray *numbers = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
	
	[numbersSection addItems:numbers];
	
	// By default, the first section has no title, but we can set change it:
	
	TableSection *firstSection = [sections objectAtIndex:0];
	firstSection.title = @"Letters";
	
	[super viewDidLoad];
}

@end
