//
//  StyledTable.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "StyledTable.h"


@implementation StyledTable

- (void)viewDidLoad
{	
	// creating a list is as simple as passing an array of string
	
	[self addItems:[NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil]];
	
	// you can also add items individually
	
	[self addItem:@"D"];
	[self addItem:@"E"];
	
	// when overriding you should always call super last
	
	
	
	[super viewDidLoad];
}

@end
