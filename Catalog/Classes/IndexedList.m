//
//  IndexedList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "IndexedList.h"


@implementation IndexedList

- (void)viewWillAppear:(BOOL)animated 
{
	self.items = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
	
	NSArray *letters = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", nil];
	
	TableSection *section;
	for (NSString *letter in letters){
		section = [[TableSection alloc] init];
		section.title = letter;
		section.items = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
		[self.sections addObject:section];
		[section release];
	}
	
	self.indexed = YES;
	
	// AbstractGenericViewController has Save and Cancel buttons by default, but since
	// we're showing a static list here there's no need for them
	
	[super viewWillAppear:animated];
}

@end
