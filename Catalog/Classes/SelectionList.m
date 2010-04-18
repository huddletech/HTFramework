//
//  SelectionList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SelectionList.h"
#import "ExampleTableItem.h"

@implementation SelectionList

- (void)viewWillAppear:(BOOL)animated 
{
	//((SelectionListViewController*)controller).delegate = self;
	TableSection *s = [self addSectionWithTitle:@"x"];
	
	[s addItem:@"A"];
	//self.items = [NSArray arrayWithObjects:@"A", @"B", @"C", nil];
	self.initialSelection = 1;
	self.showSaveButton = YES;
	
	// AbstractGenericViewController has Save and Cancel buttons by default, but since
	// we're showing a static list here there's no need for them
	
	[super viewWillAppear:animated];
}

@end


