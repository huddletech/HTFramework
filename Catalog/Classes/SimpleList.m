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
	// creating a list is as simple as passing an array of string
	
	self.items = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];

	// you can also add items individually
	
	[self addItem:@"D"];
	[self addItem:@"E"];
	
	// when overriding you should always call super last
	
	[super viewDidLoad];
}

@end
