//
//  ExampleListViewController.m
//  Catalog
//
//  Created by Andy Waite on 13/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ListWithSections.h"
#import "ExampleTableItem.h"


@implementation ListWithSections

- (void)viewDidLoad{

	self.items = [NSArray arrayWithObjects:@"X", @"Y", @"Z", nil];
	
	TableSection *numbersSection = [self addSectionWithTitle:@"Numbers"];
	
	NSArray *numbers = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
	
	[numbersSection addItems:numbers];

	[super viewDidLoad];
}

@end
