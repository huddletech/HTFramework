//
//  EditableSelectionList.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EditableSelectionList.h"


@implementation EditableSelectionList

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.delegate = self;
	self.items = [NSMutableArray arrayWithObjects:@"A", @"B", @"C", nil];
	self.initialSelection = 1;
}

- (void)rowChosen:(NSInteger)row fromArray:(NSArray *)theList;
{
    NSLog(@"You chose row %i from array %@", row, theList);
}

@end
