//
//  SimpleList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "SimpleList.h"


@implementation SimpleList

- (void)viewDidLoad
{	
	// creating a list is as simple as passing an array of strings
	self.items = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];

	// you can also add items individually
	[self addItem:@"D"];
	[self addItem:@"E"];
	
	// when overriding viewDidLoad you should always call the superclass's viewDidLoad last
	[super viewDidLoad];
}

@end
