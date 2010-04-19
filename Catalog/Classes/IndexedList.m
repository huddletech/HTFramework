//
//  IndexedList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "IndexedList.h"


@implementation IndexedList

- (void)viewDidLoad
{
	
	// an indexed list displays the title of each section in a vertical list
	self.indexed = YES;
	
	// set up the list content in the usual way
	NSArray *letters = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", nil];
	
	TableSection *section = nil;
	for (NSString *letter in letters){
		section = [self addSectionWithTitle:letter];
		section.items = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
	}
	
	[super viewDidLoad];
}

@end
