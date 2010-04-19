//
//  EditableList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "EditableList.h"


@implementation EditableList

-(void)viewDidLoad{
	
	self.showEditButton = YES;
	
	TableSection *section = [self addSectionWithTitle:@"Numbers"];
	NSArray *itemsForSection = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
	[section addItems:itemsForSection];
	
	// removing an item from the list on screen is done for you, but to make the
    // deletion permanent you need to implement didDeleteItem:atIndexPath in your subclass
	// to do something such as delete the row from the database, delete a file, send a
	// delete request to a remote server
	
	[super viewDidLoad];
}

@end
