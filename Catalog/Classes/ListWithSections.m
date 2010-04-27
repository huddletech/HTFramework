//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "ListWithSections.h"


@implementation ListWithSections

- (void)viewDidLoad{

	// All tableviews contain at least one section. By default, items are added
	// to the first section.
	
	[self addItems:[NSArray arrayWithObjects:@"X", @"Y", @"Z", nil]];
	
	// A TableSection object is just a collection of items, along with an optional title
	TableSection *numbersSection = [self addSectionWithTitle:@"Numbers"];	
	
	// You can add items to a particular section
	NSArray *numbers = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
	[numbersSection addItems:numbers];
	
	// By default, the first section has no title, but it can be set
	TableSection *firstSection = [sections objectAtIndex:0];
	firstSection.title = @"Letters";
	
	// as always, remember to call the superclass's viewDidLoad
	[super viewDidLoad];
}

@end
