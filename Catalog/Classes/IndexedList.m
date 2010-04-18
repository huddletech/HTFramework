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
	NSArray *letters = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", nil];
	
	TableSection *section = nil;
	for (NSString *letter in letters){
		section = [self addSectionWithTitle:letter];
		section.items = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
	}
	
	self.indexed = YES;
	
	[super viewWillAppear:animated];
}

@end
