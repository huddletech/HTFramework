//
//  SimpleList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SimpleList.h"


@implementation SimpleList

- (void)viewDidLoad
{	
	// All tableviews contain at least one section. By default, items are added
	// to the first section.
	
	self.items = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];

	// add some more items
	
	[self addItem:@"D"];
	[self addItem:@"E"];
	
	[super viewDidLoad];
}

@end
